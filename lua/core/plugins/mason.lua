return {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = {
        {
            "<leader>cm",
            "<cmd>Mason<cr>",
            desc = "Mason",
        },
    },
    build = ":MasonUpdate",
    opts_extend = { "ensure_installed" },
    opts = {
        ui = {
            icons = {
                package_installed = "",
                package_pending = "",
                package_uninstalled = "",
            },
            border = "rounded",
        },
        ensure_installed = {
            "bash-language-server",
            "black",
            "css-lsp",
            "html-lsp",
            "isort",
            "latexindent",
            "lua-language-server",
            "marksman",
            "prettier",
            "pyright",
            "shellcheck",
            "shfmt",
            "stylua",
            "taplo",
            "texlab",
        },
    },
    config = function(_, opts)
        require("mason").setup(opts)
        local mr = require("mason-registry")
        mr.refresh(function()
            for _, tool in ipairs(opts.ensure_installed) do
                local p = mr.get_package(tool)
                if not p:is_installed() then
                    p:install()
                end
            end
        end)
    end,
}