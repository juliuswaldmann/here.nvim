local M = {}

function M.getCurrentBufferType()
    local bufnr = vim.api.nvim_get_current_buf()
    local buftype = vim.bo[bufnr].buftype
    local filetype = vim.bo[bufnr].filetype

    if buftype == "terminal" then
        return "terminal"
    elseif filetype == "netrw" then
        return "netrw"
    elseif buftype == "" then
        return "file"
    else
        return "other"
    end
end

function M.getTerminalWorkingDir()
    local term_chan = vim.b.terminal_job_id
    if not term_chan then
        return nil
    end
    local termpid = vim.fn.jobpid(term_chan)

    local lsofcmd = string.format("lsof -a -d cwd -p %d | tail -n 1 | awk '{print $NF}'", termpid)

    local cwd = vim.fn.system(lsofcmd):gsub("%s+$", "")

    return cwd
end

function M.getNetRWWorkingDir()
    local bufnr = vim.api.nvim_get_current_buf()
    local filetype = vim.bo[bufnr].filetype
    if filetype == "netrw" then
        return vim.b[bufnr].netrw_curdir
    else
        return nil
    end
end

function M.getFileWorkingDir()
    local bufnr = vim.api.nvim_get_current_buf()
    local buftype = vim.bo[bufnr].buftype

    if buftype == '' then
        local filepath = vim.api.nvim_buf_get_name(bufnr)
        local dir = vim.fn.fnamemodify(filepath, ':h')
        return dir
    else
        return nil
    end
end

function M.setTabDir()
    
end

return M
