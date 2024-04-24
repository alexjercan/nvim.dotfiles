return {
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            "nvim-neotest/neotest-plenary",
            "nvim-neotest/neotest-python",
            "rouge8/neotest-rust",
        },
        opts = {
            adapters = {
                ["neotest-plenary"] = {
                    -- this is my standard location for minimal vim rc
                    -- in all my projects
                    min_init = "./scripts/tests/minimal.vim",
                },
                ["neotest-rust"] = {
                    args = { "--no-capture" },
                },
                ["neotest-python"] = {
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
                    python = "python",
                    -- Returns if a given file path is a test file.
                    -- NB: This function is called a lot so don't perform any heavy tasks within it.
                    is_test_file = function(file_path)
                        return file_path:match("test_.*%.py$") ~= nil
                    end,
                    -- !!EXPERIMENTAL!! Enable shelling out to `pytest` to discover test
                    -- instances for files containing a parametrize mark (default: false)
                    -- pytest_discover_instances = true,
                }
            },
            consumers = {
                trouble = function(client)
                    client.listeners.results = function(adapter_id, results, partial)
                        if partial then
                            return
                        end
                        local tree = assert(client:get_position(nil, { adapter = adapter_id }))

                        local failed = 0
                        for pos_id, result in pairs(results) do
                            if result.status == "failed" and tree:get_key(pos_id) then
                                failed = failed + 1
                            end
                        end
                        vim.schedule(function()
                            local trouble = require("trouble")
                            if trouble.is_open() then
                                trouble.refresh()
                                if failed == 0 then
                                    trouble.close()
                                end
                            end
                        end)
                        return {}
                    end
                end
            },
            status = { virtual_text = true },
            output = { open_on_run = true },
            quickfix = {
                open = function()
                    require("trouble").open({ mode = "quickfix", focus = false })
                end,
            },
        },
        config = function(_, opts)
            local neotest_ns = vim.api.nvim_create_namespace("neotest")
            vim.diagnostic.config({
                virtual_text = {
                    format = function(diagnostic)
                        -- Replace newline and tab characters with space for more compact diagnostics
                        local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+",
                            "")
                        return message
                    end,
                },
            }, neotest_ns)

            local neotest = require("neotest")

            if opts.adapters then
                local adapters = {}
                for name, config in pairs(opts.adapters or {}) do
                    if type(name) == "number" then
                        if type(config) == "string" then
                            config = require(config)
                        end
                        adapters[#adapters + 1] = config
                    elseif config ~= false then
                        local adapter = require(name)
                        if type(config) == "table" and not vim.tbl_isempty(config) then
                            local meta = getmetatable(adapter)
                            if adapter.setup then
                                adapter.setup(config)
                            elseif meta and meta.__call then
                                adapter(config)
                            else
                                error("Adapter " .. name .. " does not support setup")
                            end
                        end
                        adapters[#adapters + 1] = adapter
                    end
                end
                opts.adapters = adapters
            end

            neotest.setup(opts)
        end,
        keys = {
            { "<leader>td", function() require("neotest").run.run({ strategy = "dap" }) end,                    desc = "Debug Nearest" },
            { "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end,                      desc = "Run File" },
            { "<leader>tc", function() require("neotest").run.run(vim.loop.cwd()) end,                          desc = "Run All Test Files" },
            { "<leader>ts", function() require("neotest").summary.toggle() end,                                 desc = "Toggle Summary" },
            { "<leader>to", function() require("neotest").output.open({ enter = true, auto_close = true }) end, desc = "Show Output" },
            { "<leader>tO", function() require("neotest").output_panel.toggle() end,                            desc = "Toggle Output Panel" },
            { "<leader>tS", function() require("neotest").run.stop() end,                                       desc = "Stop" },
        },
    },
}
