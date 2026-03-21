local map = require("utils").map
local fzflua = require("fzf-lua")

fzflua.setup({
	winopts = {
		height = 0.7,
		width = 0.55,
		preview = {
			scrollbar = false,
			layout = "vertical",
			vertical = "up:40%",
		},
	},
	fzf_opts = {
		["--info"] = "default",
		["--layout"] = "reverse-list",
	},
	files = {
		winopts = {
			preview = { hidden = true },
		},
	},
	grep = {
		hidden = true,
		rg_opts = '--column --line-number --no-heading --color=always --smart-case --max-columns=4096 -g "!.git" -e',
		rg_glob_fn = function(query, opts)
			local regex, flags = query:match(string.format("^(.*)%s(.*)$", opts.glob_separator))
			-- Return the original query if there's no separator.
			return (regex or query), flags
		end,
	},
	lsp = {
		code_actions = {
			winopts = {
				width = 70,
				height = 20,
				relative = "cursor",
				preview = {
					hidden = true,
					vertical = "down:50%",
				},
			},
		},
	},
	diagnostics = {
		multiline = 1,
		actions = {
			["ctrl-e"] = {
				fn = function(_, opts)
					-- If not filtering by severity, show all diagnostics.
					if opts.severity_only then
						opts.severity_only = nil
					else
						-- Else only show errors.
						opts.severity_only = vim.diagnostic.severity.ERROR
					end
					require("fzf-lua").resume(opts)
				end,
				noclose = true,
				desc = "toggle-all-only-errors",
				header = function(opts)
					return opts.severity_only and "show all" or "show only errors"
				end,
			},
		},
	},
	oldfiles = {
		include_current_session = true,
		winopts = {
			preview = { hidden = true },
		},
	},
})

vim.keymap.set("n", "<leader>gw", function()
	local output = vim.fn.systemlist("git worktree list --porcelain")
	local worktrees = {}

	for _, line in ipairs(output) do
		local path = line:match("^worktree (.+)")
		if path then
			table.insert(worktrees, path)
		end
	end

	fzflua.fzf_exec(worktrees, {
		prompt = "Worktrees❯ ",
		actions = {
			["default"] = function(selected)
				local path = selected[1]
				-- Change global working directory
				vim.cmd("cd " .. vim.fn.fnameescape(path))
				-- Close all buffers
				vim.cmd("%bdelete!")
				-- Open the root directory (or swap for a file picker)
				vim.cmd("edit " .. vim.fn.fnameescape(path))
			end,
		},
	})
end)

map("n", "<Leader>ff", fzflua.files)
map("n", "<Leader>fg", fzflua.live_grep_native)
map("n", "<Leader>gc", fzflua.git_bcommits)
map("n", "<Leader>wd", fzflua.lsp_document_symbols)
map("n", "<Leader>ww", fzflua.lsp_live_workspace_symbols)
map("n", "<Leader>xx", fzflua.lsp_workspace_diagnostics)
map("n", "T", fzflua.tabs)
map("n", "<Leader>m", fzflua.marks)
map("n", "gr", fzflua.lsp_references)
map("n", "gi", fzflua.lsp_implementations)
map("n", "gR", fzflua.lsp_definitions)
map("n", "<Space>ca", fzflua.lsp_code_actions)
map("n", "<Leader>gb", fzflua.git_branches)
map("n", "<Leader>gf", fzflua.git_files)
map("n", "<Leader>//", fzflua.resume)
