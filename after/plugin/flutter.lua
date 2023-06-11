require("flutter-tools").setup {
    outline = {
        open_cmd = "30vnew", -- command to use to open the outline buffer
        auto_open = false    -- if true this will open the outline automatically when it is first populated
    },
    widget_guides = {
        enabled = true,
    },
    debugger = {
        enabled = true,
        register_configurations = function(_)
            require("dap").configurations.dart = {}
            require("dap.ext.vscode").load_launchjs()
        end,
    },
}
