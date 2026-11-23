-- ~/.config/nvim/lua/config/keymaps.lua

local map = vim.keymap.set

-- Graphite layout (replaces the old langmap). Letters keep their vim meaning,
-- except: movement on y h a e (QWERTY hjkl spot), append on n (mirrors i),
-- and whatever those displace moves to the freed j k l.
local nxo = { "n", "x", "o" }
-- movement
map(nxo, "y", "h")
map(nxo, "h", "j")
map(nxo, "a", "k")
map(nxo, "e", "l")
-- displaced commands
map(nxo, "j", "y") -- yank (jj = yank line)
map("n", "J", "y$")
map("x", "J", "Y")
map(nxo, "k", "n") -- search next/prev (k sits where QWERTY n was)
map(nxo, "K", "N")
map(nxo, "l", "e") -- end of word/WORD
map(nxo, "L", "E")
map("n", "n", "a") -- append / append at end of line
map("n", "N", "A")
map({ "x", "o" }, "n", "a") -- "around" text objects: dnw, cn( (mirrors i = inner)
map("x", "N", "A")
-- shifted movement keys do what shifted hjkl did
map(nxo, "Y", "H") -- screen top
map({ "n", "x" }, "H", "J") -- join lines
map({ "n", "x" }, "A", "K") -- keywordprg; LSP hover set below
map(nxo, "E", "L") -- screen bottom

vim.api.nvim_create_autocmd("LspAttach", {
    desc = "LSP hover on A (Graphite shift-up)",
    group = vim.api.nvim_create_augroup("graphite-lsp", { clear = true }),
    callback = function(ev)
        map("n", "A", vim.lsp.buf.hover, { buffer = ev.buf, desc = "LSP hover" })
        map("n", "K", "N", { buffer = ev.buf }) -- keep K = search prev over the LSP default
    end,
})

-- Original smart <leader>r runner: SQL query when in SQL files,
-- runs Python script in a terminal split otherwise
map({ "n", "v" }, "<leader>r", function()
    local ft = vim.bo.filetype
    if ft == "sql" or ft == "mysql" or ft == "plsql" then
        vim.cmd("DB")
    elseif ft == "python" then
        vim.cmd("w")
        vim.cmd("split | terminal python3 " .. vim.fn.expand("%"))
        vim.cmd("startinsert")
    elseif ft == "rust" then
        vim.cmd("w")
        vim.cmd("split | terminal cargo run")
        vim.cmd("startinsert")
    else
        print("No runner configured for filetype: " .. ft)
    end
end, { silent = true, desc = "Run code / SQL query" })

-- Window navigation (same y h a e as movement and Hyprland)
map("n", "<C-y>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-e>", "<C-w>l", { desc = "Go to right window" })
map("n", "<C-h>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-a>", "<C-w>k", { desc = "Go to upper window" })
map({ "n", "x" }, "<C-k>", "<C-a>", { desc = "Increment number" }) -- displaced from <C-a>

-- Better indenting in visual mode
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Diagnostics
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic" })

-- snacks.picker (fuzzy finder) -- these are guarded so keymaps.lua can load
-- even before the plugin is installed on first run
local function snacks_pick(fn)
    return function()
        local ok, snacks = pcall(require, "snacks")
        if ok then snacks.picker[fn]() end
    end
end

map("n", "<leader>ff", snacks_pick("files"), { desc = "Find files" })
map("n", "<leader>fg", snacks_pick("grep"), { desc = "Grep in project" })
map("n", "<leader>fb", snacks_pick("buffers"), { desc = "Find buffers" })
map("n", "<leader>fr", snacks_pick("recent"), { desc = "Recent files" })
map("n", "<leader>fs", snacks_pick("lsp_symbols"), { desc = "Document symbols" })
map("n", "<leader>fd", snacks_pick("diagnostics"), { desc = "Diagnostics" })
