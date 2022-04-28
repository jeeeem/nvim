local create_command = vim.api.nvim_create_user_command

create_command("Format", vim.lsp.buf.formatting_seq_sync, {})
create_command("Rg", "FzfLua live_grep", {})
