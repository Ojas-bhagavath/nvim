return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            "<leader>cf",
            function()
                require("conform").format({ async = true, lsp_fallback = true })
            end,
            mode = "",
            desc = "Code Format",
        },
    },
    opts = {
        notify_on_error = true,
        format_on_save = function(bufnr)
            local disable_filetypes = { c = true, cpp = true }
            return {
                timeout_ms = 500,
                lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
            }
        end,
        --         formatters = {
        --             latexindent = {
        --                  args =
        --             }
        --         },
        formatters_by_ft = {
            bash = { "shfmt" },
            html = { "htmlbeautifier" },
            lua = { "stylua" },
            markdown = { "prettier" },
            python = { "black" },
            shell = { "shfmt" },
            toml = { "taplo" },
        },
    },
}
