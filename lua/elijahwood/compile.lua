-- Table which maps language types to respective compile commands
local run_commands = {
	python = "python %",
	javascript = "node %",
	typescript = "ts-node %",
	lua = "lua %",
	sh = "bash %",
	go = "go run %",
	rust = "cargo run",
	java = "javac % && java %:r",
}

-- Getting the current active LSP
local function get_active_lsp()
	-- Clients from current buffer
	local clients = vim.lsp.get_active_clients({bufnr = 0});
	
	-- Ensuring clients exist
	if #clients > 0 then
		return clients[1].name
	end
	return nil
end

-- Creating a function which checks filetype and lsp language and calls
-- a command based on the table above
function run_file()
	-- getting the filetype and lsp name
	local filetype = vim.bo.filetype
	local lsp_langauge = get_active_lsp()
	
	-- Getting the command based on our table
	local command = run_commands[filetype] or run_commands[lsp_language]

	-- Ensuring command exists
	if not command then
		print("Filetype {filetype} cannot be run (not recognized)");
	return
	end
	
	-- Getting absolute path of file
	--	local abs_path = vim.fn.expand("%:p");
	--	command = command:gsub("%%", abs_path);

	-- Execute the command
	vim.cmd("!" .. command);
end

-- Using run_file for custom compile/run command
vim.keymap.set("n", "<leader>cr", "<cmd>lua run_file()<CR>");
