-- Main Neovim configuration file

require("config.lazybootstrap") -- Bootstrap Lazy package manager
require("config.leader")        -- Set leader key before loading Lazy
require("config.vimopts")       -- Setup other settings (vim.opt)
require("config.keymaps")       -- Define custom keymappings
require("config.autocommands")  -- Define custom autocommands
require("config.lazysetup")     -- Setup and load Lazy package manager

print("Neovim configuration loaded successfully!")

