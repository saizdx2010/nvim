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
        run_via_dap = true,

        register_configurations = function(_)
            require("dap").adapters.dart = {
                type = 'executable',
                command = 'dart',
                args = { 'debug_adapter' }
            }
            require("dap").adapters.flutter = {
                type = 'executable',
                command = 'flutter',
                args = { 'debug_adapter' }
            }
            require("dap").configurations.dart = {
                {
                    type = "flutter",
                    request = "launch",
                    name = "Launch flutter",
                    dartSdkPath = "/Users/saiprashanth/development/flutter/bin/cache/dart-sdk/bin/dart",
                    flutterSdkPath = "/Users/saiprashanth/development/flutter/bin/flutter",
                    program = "${workspaceFolder}/lib/main.dart",
                    cwd = "${workspaceFolder}",
                },
                {
                    type = "flutter",
                    request = "launch",
                    name = "Launch flutter Staging",
                    flutter_mode = "staging",
                    dartSdkPath = "/Users/saiprashanth/development/flutter/bin/cache/dart-sdk/bin/dart",
                    flutterSdkPath = "/Users/saiprashanth/development/flutter/bin/flutter",
                    program = "${workspaceFolder}/lib/main.dart",
                    cwd = "${workspaceFolder}",
                    args = { '--flavor', 'staging' }
                },
            }
            require("dap.ext.vscode").load_launchjs()
        end,
    },
}
