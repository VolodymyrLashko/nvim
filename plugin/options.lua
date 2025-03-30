local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.smartcase = true
opt.ignorecase = true

opt.tabstop = 4
opt.shiftwidth = 4

opt.scrolloff = 10

opt.clipboard = "unnamedplus"

opt.more = false

opt.foldmethod = "manual"

opt.title = true
opt.titlestring = '%t%( %M%)%( (%{expand("%:~:h")})%)%a (nvim)'

opt.undofile = true

-- Debug
-- print("loaded options.lua")
