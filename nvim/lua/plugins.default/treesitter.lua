return {
    {
        "nvim-treesitter/nvim-treesitter",
        version = false, -- last release is way too old and doesn't work on Windows
        build = ":TSUpdate",
        init = function(plugin)
          -- PERF: add nvim-treesitter queries to the rtp and it's custom query predicates early
          -- This is needed because a bunch of plugins no longer `require("nvim-treesitter")`, which
          -- no longer trigger the **nvim-treeitter** module to be loaded in time.
          -- Luckily, the only thins that those plugins need are the custom queries, which we make available
          -- during startup.
          require("lazy.core.loader").add_to_rtp(plugin)
          require("nvim-treesitter.query_predicates")
        end,
        cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
        opts = {
            -- A list of parser names, or "all"
            ensure_installed = { "lua" },

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
            auto_install = true,

            highlight = {
                -- `false` will disable the whole extension
                enable = true,

                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                -- Using this option may slow down your editor, and you may see some duplicate highlights.
                -- Instead of true it can also be a list of languages
                additional_vim_regex_highlighting = false,
            },

            indent = { enable = true },
        },
        config = function(_, opts)
            if type(opts.ensure_installed) == "table" then
                ---@type table<string, boolean>
                local added = {}
                opts.ensure_installed = vim.tbl_filter(function(lang)
                    if added[lang] then
                        return false
                    end
                    added[lang] = true
                    return true
                end, opts.ensure_installed)
            end
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
    "nvim-treesitter/playground",
    {
        "nvim-treesitter/nvim-treesitter-context",
        enabled = true,
        opts = { mode = "cursor", max_lines = 3 },
        keys = {
            {
                "<leader>ut", function() require("treesitter-context").toggle() end,
                desc = "Toggle Treesitter Context",
            },
        },
    }
}
