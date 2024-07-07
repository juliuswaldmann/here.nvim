local utils = require("here.utils")
local function getCurrentDir()
    local currentBuftype = utils.getCurrentBufferType()

    local wd = nil
    if currentBuftype == "terminal" then
        wd = utils.getTerminalWorkingDir()
    elseif currentBuftype == "netrw" then
        wd = utils.getNetRWWorkingDir()
    elseif currentBuftype == "file" then
        wd = utils.getFileWorkingDir()
    end

    return wd
end

local function unsupportedBuftype()
    print("Current buffertype not supported. Supported buftypes are terminal, netrw and file")
end

local function cdHere()
    local dir = getCurrentDir()
    if dir == nil then
        unsupportedBuftype()
        return
    end
    vim.cmd('cd ' .. dir)
    print("changed global directory to ", dir)
end

local function tcdHere()
    local dir = getCurrentDir()
    if dir == nil then
        unsupportedBuftype()
        return
    end
    vim.cmd('tcd ' .. dir)
    print("changed tab-wide directory to ", dir)
end

local function lcdHere()
    local dir = getCurrentDir()
    if dir == nil then
        unsupportedBuftype()
        return
    end
    vim.cmd('lcd ' .. dir)
    print("changed window-wide directory to ", dir)
end

vim.api.nvim_create_user_command('Here', cdHere, {})
vim.api.nvim_create_user_command('CdHere', cdHere, {})
vim.api.nvim_create_user_command('TcdHere', tcdHere, {})
vim.api.nvim_create_user_command('LcdHere', lcdHere, {})
