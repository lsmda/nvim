local M = {}

M.confirm_quit = function(command, input, default_choice)
	default_choice = default_choice or false
	input = input or "Are you sure you want to quit? (y/N): "

	local choice = ""

	if not default_choice then
		choice = vim.fn.input(input)
	end

	if default_choice or choice:lower() == "y" then
		vim.cmd(command)
	end
end

M.save_file = function()
	local is_floating_window_open = false
	for _, win in pairs(vim.api.nvim_list_wins()) do
		local config = vim.api.nvim_win_get_config(win)
		if config.relative ~= "" then
			is_floating_window_open = true
			break
		end
	end

	if
		vim.bo.modifiable
		and vim.bo.modified
		and not vim.bo.readonly
		and vim.bo.buftype == ""
		and not is_floating_window_open
	then
		vim.cmd("write")
	end
end

M.get_float_opts = function(options)
	options = options or {}
	return {
		border = options.border or "rounded",
		prefix = options.prefix or " ",
		severity_sort = options.severity_sort or true,
		scope = options.scope or "buffer",
		source = options.source or false,
	}
end

M.icons = {
	kind = {
		Array = " ",
		Boolean = " ",
		Class = " ",
		Color = " ",
		Constant = " ",
		Constructor = " ",
		Enum = " ",
		EnumMember = " ",
		Event = " ",
		Field = " ",
		File = " ",
		Folder = "󰉋 ",
		Function = " ",
		Interface = " ",
		Key = " ",
		Keyword = " ",
		Method = " ",
		Module = " ",
		Namespace = " ",
		Null = "󰟢 ",
		Number = " ",
		Object = " ",
		Operator = " ",
		Package = " ",
		Property = " ",
		Reference = " ",
		Snippet = " ",
		String = " ",
		Struct = " ",
		Text = " ",
		TypeParameter = " ",
		Unit = " ",
		Value = " ",
		Variable = " ",
	},
	git = {
		LineAdded = " ",
		LineModified = " ",
		LineRemoved = " ",
		FileDeleted = " ",
		FileIgnored = "◌",
		FileRenamed = " ",
		FileStaged = "S",
		FileUnmerged = "",
		FileUnstaged = "",
		FileUntracked = "U",
		Diff = " ",
		Repo = " ",
		Octoface = " ",
		Branch = "",
	},
	ui = {
		ArrowCircleDown = "",
		ArrowCircleLeft = "",
		ArrowCircleRight = "",
		ArrowCircleUp = "",
		BoldArrowDown = "",
		BoldArrowLeft = "",
		BoldArrowRight = "",
		BoldArrowUp = "",
		BoldClose = "",
		BoldDividerLeft = "",
		BoldDividerRight = "",
		BoldLineLeft = "▎",
		BookMark = "",
		BoxChecked = "",
		Bug = " ",
		Stacks = "",
		Scopes = "",
		Watches = "󰂥",
		DebugConsole = "",
		Calendar = "",
		Check = "",
		ChevronRight = "",
		ChevronShortDown = "",
		ChevronShortLeft = "",
		ChevronShortRight = "",
		ChevronShortUp = "",
		Circle = " ",
		Close = "󰅖",
		CloudDownload = " ",
		Code = "",
		Comment = "",
		Dashboard = "",
		DividerLeft = "",
		DividerRight = "",
		DoubleChevronRight = "»",
		Ellipsis = "",
		EmptyFolder = "",
		EmptyFolderOpen = "",
		File = "",
		FileSymlink = "",
		Files = " ",
		FindFile = "󰈞",
		FindText = "󰊄",
		Fire = "",
		Folder = "󰉋 ",
		FolderOpen = " ",
		FolderSymlink = "",
		Forward = " ",
		Gear = " ",
		History = " ",
		Lightbulb = " ",
		LineLeft = "▏",
		LineMiddle = "│",
		List = " ",
		Lock = " ",
		NewFile = " ",
		Note = " ",
		Package = " ",
		Pencil = "󰏫 ",
		Plus = " ",
		Project = " ",
		Search = " ",
		SignIn = " ",
		SignOut = " ",
		Tab = "󰌒 ",
		Table = " ",
		Target = "󰀘 ",
		Telescope = " ",
		Text = " ",
		Tree = "",
		Triangle = "󰐊",
		TriangleShortArrowDown = "",
		TriangleShortArrowLeft = "",
		TriangleShortArrowRight = "",
		TriangleShortArrowUp = "",
	},
	diagnostics = {
		BoldError = "",
		Error = "",
		BoldWarning = "",
		Warning = "",
		BoldInformation = "",
		Information = "",
		BoldQuestion = "",
		Question = "",
		BoldHint = "",
		Hint = "󰌶",
		Debug = "",
		Trace = "✎",
	},
	misc = {
		Robot = "󰚩 ",
		Squirrel = "",
		Tag = "",
		Watch = "",
		Smiley = "",
		Package = "",
		CircuitBoard = "",
	},
	symbol_kinds = {
		Text = "  ",
		Method = "  ",
		Function = "  ",
		Constructor = "  ",
		Field = "  ",
		Variable = "  ",
		Class = "  ",
		Interface = "  ",
		Module = "  ",
		Property = "  ",
		Unit = "  ",
		Value = "  ",
		Enum = "  ",
		Keyword = "  ",
		Snippet = "  ",
		Color = "  ",
		File = "  ",
		Reference = "  ",
		Folder = "  ",
		EnumMember = "  ",
		Constant = "  ",
		Struct = "  ",
		Event = "  ",
		Operator = "  ",
		TypeParameter = "  ",
	},
}

return M
