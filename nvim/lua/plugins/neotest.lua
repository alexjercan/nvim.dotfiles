return {
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            "nvim-neotest/neotest-plenary",
            "nvim-neotest/neotest-python",
        },
        config = function()
            local neotest = require("neotest")
            neotest.setup({
                adapters = {
                    require("neotest-plenary").setup({
                        -- this is my standard location for minimal vim rc
                        -- in all my projects
                        min_init = "./scripts/tests/minimal.vim",
                    }),
                    require("neotest-python")({
                        -- Extra arguments for nvim-dap configuration
                        -- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
                        dap = { justMyCode = false },
                        -- Command line arguments for runner
                        -- Can also be a function to return dynamic values
                        args = { "--log-level", "DEBUG" },
                        -- Runner to use. Will use pytest if available by default.
                        -- Can be a function to return dynamic value.
                        runner = "pytest",
                        -- Custom python path for the runner.
                        -- Can be a string or a list of strings.
                        -- Can also be a function to return dynamic value.
                        -- If not provided, the path will be inferred by checking for
                        -- virtual envs in the local directory and for Pipenev/Poetry configs
                        python = ".venv/bin/python",
                        -- Returns if a given file path is a test file.
                        -- NB: This function is called a lot so don't perform any heavy tasks within it.
                        is_test_file = function(file_path)
                            return file_path:match("test_.*%.py$") ~= nil
                        end,
                        -- !!EXPERIMENTAL!! Enable shelling out to `pytest` to discover test
                        -- instances for files containing a parametrize mark (default: false)
                        -- pytest_discover_instances = true,
                    })
                }
            })

            vim.keymap.set("n", "<leader>tc", function()
                neotest.run.run()
            end)

            vim.keymap.set("n", "<leader>tf", function()
                neotest.run.run(vim.fn.expand("%"))
            end)
        end,
    },
}
