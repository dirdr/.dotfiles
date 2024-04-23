-- format buffer,
-- 1. check if autoformat is enabled
-- 2. check if a null-ls formatter is attached to the buffer
-- 3. use null-ls if avaible else use any other connected lsp that support formatting
local formatting_buffer = function()
  local buf = vim.api.nvim_get_current_buf()
  -- don't format if autoformat is disabled
  if require("plugins.formatting.autoformat").autoformat == false then
    return
  end

  local ft = vim.bo[buf].filetype
  local have_nls = #require("null-ls.sources").get_available(ft, "NULL_LS_FORMATTING") > 0

  vim.lsp.buf.format({
    bufnr = buf,
    timeout_ms = 5000,
    filter = function(client)
      if have_nls then
        return client.name == "null-ls"
      end
      return true
    end,
  })
end

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("LspFormatting", {}),
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("LspAutoFormat." .. bufnr, {}),
        buffer = bufnr,
        callback = function()
          if not require("plugins.formatting.autoformat").autoformat then
            return
          end
          formatting_buffer()
        end,
      })

      vim.api.nvim_create_user_command("FormatToggle", function()
        require("plugins.formatting.autoformat").toggle()
      end, { desc = "Toggle Format on Save" })
    end
  end,
})

local formatters = require("plugins.formatting.formatters")
local sources = {} -- a list of to_register_wrap
for formatter, setting in pairs(formatters) do
  if not setting.disabled then
    sources[formatter] = setting.to_register_wrap
  end
end

return {
  "nvimtools/none-ls.nvim",
  opts = sources, -- passed to the parent spec's config()
}
