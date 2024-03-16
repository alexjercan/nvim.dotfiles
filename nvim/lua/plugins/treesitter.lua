return {
    {
        "nvim-treesitter/nvim-treesitter",
        version = false, -- last release is way too old and doesn't work on Windows
        build = ":TSUpdate",
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
                -- Set this to `true` if you depend on "syntax" being enabled (like for indentation).
                -- Using this option may slow down your editor, and you may see some duplicate highlights.
                -- Instead of true it can also be a list of languages
                additional_vim_regex_highlighting = { "markdown" },
            },

            indent = { enable = true },
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)

            local parser_config = require "nvim-treesitter.parsers".get_parser_configs()

            -- TODO: figure out how to make this work
            parser_config.brainfuck = {
                install_info = {
                    url = "https://github.com/hrmorley34/tree-sitter-brainfuck.git",
                    files = { "src/parser.c" },            -- note that some parsers also require src/scanner.c or src/scanner.cc
                    -- optional entries:
                    branch = "main",                       -- default branch in case of git repo if different from master
                    generate_requires_npm = true,          -- if stand-alone parser without npm dependencies
                    requires_generate_from_grammar = true, -- if folder contains pre-generated src/parser.c
                },
            }

            vim.filetype.add({
                pattern = { ["*%.bf"] = "brainfuck" },
            })

            parser_config.hyprlang = {
                install_info = {
                    url = "https://github.com/tree-sitter-grammars/tree-sitter-hyprlang.git",
                    files = { "src/parser.c" }, -- note that some parsers also require src/scanner.c or src/scanner.cc
                    -- optional entries:
                    branch = "master",          -- default branch in case of git repo if different from master
                },
            }

            vim.filetype.add({
                pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
            })

            parser_config.templ = {
                install_info = {
                    url = "https://github.com/vrischmann/tree-sitter-templ.git",
                    files = { "src/parser.c", "src/scanner.c" }, -- note that some parsers also require src/scanner.c or src/scanner.cc
                    -- optional entries:
                    branch = "master",                           -- default branch in case of git repo if different from master
                },
            }
        end,
    },
    "nvim-treesitter/playground",
    {
        "nvim-treesitter/nvim-treesitter-context",
        enabled = true,
        opts = { enable = true, mode = "cursor", max_lines = 3, trim_scope = "inner" },
        keys = {
            {
                "<leader>ut",
                function() require("treesitter-context").toggle() end,
                desc = "Toggle Treesitter Context",
            },
        },
    }
}
