-- Parsers we want available everywhere; installed eagerly on startup.
local ensure_installed = {
  "lua",
  "java",
  "python",
  "bash",
  "javascript",
  "typescript",
  "html",
  "css",
  "json",
  "markdown",
  "c",
  "rust",
  "go",
}

-- Lightweight reimplementation of nvim-treesitter (master) `incremental_selection`,
-- which was removed on the `main` branch.
local incsel = {}
local stacks = {} -- bufnr -> list of TSNodes (selection history)

local function range_eq(a, b)
  local a1, a2, a3, a4 = a:range()
  local b1, b2, b3, b4 = b:range()
  return a1 == b1 and a2 == b2 and a3 == b3 and a4 == b4
end

local function select_node(node)
  local sr, sc, er, ec = node:range()
  -- end_col is exclusive; convert to an inclusive cursor position
  if ec == 0 and er > 0 then
    er = er - 1
    ec = #(vim.api.nvim_buf_get_lines(0, er, er + 1, false)[1] or "")
  end
  local line = vim.api.nvim_buf_get_lines(0, er, er + 1, false)[1] or ""
  ec = math.min(math.max(ec - 1, 0), math.max(#line - 1, 0))
  vim.api.nvim_win_set_cursor(0, { sr + 1, sc })
  vim.cmd("normal! v")
  vim.api.nvim_win_set_cursor(0, { er + 1, ec })
end

function incsel.init()
  local node = vim.treesitter.get_node()
  if not node then
    return
  end
  stacks[vim.api.nvim_get_current_buf()] = { node }
  select_node(node)
end

local function grow(to_scope)
  local buf = vim.api.nvim_get_current_buf()
  local stack = stacks[buf]
  if not stack or #stack == 0 then
    return incsel.init()
  end
  local node = stack[#stack]
  local parent = node:parent()
  -- skip ancestors covering the exact same range
  while parent and range_eq(parent, node) do
    parent = parent:parent()
  end
  if to_scope then
    local scope_types = {
      block = true,
      statement_block = true,
      function_declaration = true,
      function_definition = true,
      ["function"] = true,
      if_statement = true,
      for_statement = true,
      while_statement = true,
      class_declaration = true,
      method_declaration = true,
      table_constructor = true,
      arguments = true,
    }
    while parent and not scope_types[parent:type()] do
      parent = parent:parent()
    end
  end
  if not parent then
    return
  end
  table.insert(stack, parent)
  select_node(parent)
end

function incsel.node_incremental()
  grow(false)
end

function incsel.scope_incremental()
  grow(true)
end

function incsel.node_decremental()
  local stack = stacks[vim.api.nvim_get_current_buf()]
  if not stack or #stack <= 1 then
    return
  end
  table.remove(stack)
  select_node(stack[#stack])
end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false, -- the `main` branch does not support lazy-loading
    build = ":TSUpdate",
    config = function()
      local ts = require("nvim-treesitter")

      -- Install the parsers we always want.
      ts.install(ensure_installed)

      -- Compatibility shim for telescope.nvim. The pinned telescope version still
      -- calls the master-branch API that `main` removed:
      --   nvim-treesitter.parsers.ft_to_lang / .get_parser
      --   nvim-treesitter.configs.is_enabled / .get_module
      -- Without this, every file preview errors with `attempt to call field
      -- 'ft_to_lang' (a nil value)`. This runs at startup (lazy = false), before
      -- telescope is lazy-loaded, so the shims are present when it captures them.
      local parsers = require("nvim-treesitter.parsers")
      parsers.ft_to_lang = parsers.ft_to_lang
        or function(ft)
          return vim.treesitter.language.get_lang(ft) or ft
        end
      parsers.get_parser = parsers.get_parser
        or function(bufnr, lang)
          return vim.treesitter.get_parser(bufnr, lang)
        end
      package.loaded["nvim-treesitter.configs"] = package.loaded["nvim-treesitter.configs"]
        or {
          is_enabled = function(_, lang, _)
            return lang ~= nil and vim.tbl_contains(ts.get_installed("parsers"), lang)
          end,
          get_module = function()
            return { enable = true, additional_vim_regex_highlighting = false }
          end,
        }

      -- Enable highlighting + indentation per buffer, and auto-install missing
      -- parsers on first open (replacement for master's `auto_install = true`).
      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
          local buf = args.buf
          local ft = args.match
          local lang = vim.treesitter.language.get_lang(ft) or ft

          if
            vim.tbl_contains(ts.get_available(), lang)
            and not vim.tbl_contains(ts.get_installed("parsers"), lang)
          then
            ts.install(lang) -- async; parser ready on next open of this filetype
          end

          if pcall(vim.treesitter.start, buf, lang) then
            vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })

      -- Incremental selection (was `init_selection`/`node_incremental`/etc.).
      vim.keymap.set("n", "<CR>", incsel.init, { desc = "TS: start selection" })
      vim.keymap.set("x", "<CR>", incsel.node_incremental, { desc = "TS: increment node" })
      vim.keymap.set("x", "<TAB>", incsel.scope_incremental, { desc = "TS: increment scope" })
      vim.keymap.set("x", "<S-TAB>", incsel.node_decremental, { desc = "TS: decrement node" })
    end,
  },
}
