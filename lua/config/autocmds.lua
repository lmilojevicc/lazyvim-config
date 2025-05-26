-- Toggle Relative and Absolute Line Numbers
vim.api.nvim_create_augroup("numbertoggle", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "WinEnter" }, {
  group = "numbertoggle",
  callback = function()
    if vim.wo.number and vim.fn.mode() ~= "i" then
      vim.wo.relativenumber = true
    end
  end,
})

vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "WinLeave" }, {
  group = "numbertoggle",
  callback = function()
    if vim.wo.number then
      vim.wo.relativenumber = false
    end
  end,
})

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  callback = function()
    if vim.o.buftype ~= "nofile" then
      vim.cmd("checktime")
    end
  end,
})

-- Resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. current_tab)
  end,
})

-- Go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function(event)
    local exclude = { "gitcommit" }
    local buf = event.buf
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
      return
    end
    vim.b[buf].lazyvim_last_loc = true
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "PlenaryTestPopup",
    "checkhealth",
    "dbout",
    "gitsigns-blame",
    "grug-far",
    "help",
    "lspinfo",
    "neotest-output",
    "neotest-output-panel",
    "neotest-summary",
    "notify",
    "qf",
    "spectre_panel",
    "startuptime",
    "tsplayground",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.schedule(function()
      vim.keymap.set("n", "q", function()
        vim.cmd("close")
        pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
      end, {
        buffer = event.buf,
        silent = true,
        desc = "Quit buffer",
      })
    end)
  end,
})

-- Make it easier to close man-files when opened inline
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "man" },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
  end,
})

-- Wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "text", "plaintex", "typst", "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- Remove completion menu background
vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" })

-- Lsp keymaps autocommand
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    local opts = { buffer = ev.buf, silent = true }
    local map = vim.keymap.set
    local has_snacks = Snacks ~= nil
    local has_fzf = pcall(require, "fzf-lua")

    if not has_snacks and not has_fzf then
      opts.desc = " LSP Go to definition"
      map("n", "gd", vim.lsp.buf.definition, opts)

      opts.desc = " LSP Go to declaration"
      map("n", "gD", vim.lsp.buf.declaration, opts)

      opts.desc = " Show LSP references"
      map("n", "gr", vim.lsp.buf.references, opts)

      opts.desc = " LSP Go to implementation"
      map("n", "gi", vim.lsp.buf.implementation, opts)

      opts.desc = " LSP Go to type definition"
      map("n", "gt", vim.lsp.buf.type_definition, opts)

      opts.desc = " LSP Document symbols"
      map("n", "<leader>ds", vim.lsp.buf.document_symbol, opts)
    end

    opts.desc = "󰌶 LSP See available code actions"
    map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

    opts.desc = "󰑕 LSP rename"
    map("n", "<leader>rn", vim.lsp.buf.rename, opts)

    opts.desc = "󰈙 LSP Show documentation under cursor"
    map("n", "gh", vim.lsp.buf.hover, opts)

    opts.desc = "󰜉 Restart LSP"
    map("n", "<leader>rs", ":LspRestart<CR>", opts)

    opts.desc = "󰊕 LSP Signature help"
    map("n", "K", vim.lsp.buf.signature_help, opts)
    map("i", "<C-k>", vim.lsp.buf.signature_help, opts)
  end,
})
