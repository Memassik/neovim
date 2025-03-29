local M = {}

M.diagnostic_config = function()
    local x = vim.diagnostic.severity

    vim.diagnostic.config {
        virtual_text = { prefix = "" },
        signs = { text = { [x.ERROR] = "E", [x.WARN] = "W", [x.INFO] = "I", [x.HINT] = "H" } },
        underline = true,
        float = { border = "single" },
    }

    -- Default border style
    local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
    function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
        opts = opts or {}
        opts.border = "rounded"
        return orig_util_open_floating_preview(contents, syntax, opts, ...)
    end
end

return M
