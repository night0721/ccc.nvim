local fileManagers = {"Ccc"}
local executable = vim.fn.executable
for _, fm in ipairs(fileManagers) do
    if executable(vim.fn.tolower(fm)) == 1 then
        vim.cmd("command! -nargs=? -complete=dir " .. fm .. " :lua require('fm-nvim')." .. fm .. "('<f-args>')")
    end
end
if executable("fnf") == 1 then
    vim.cmd [[ command! Fnf :lua require('fm-nvim').Fnf() ]]
end
