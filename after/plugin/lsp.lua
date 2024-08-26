local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
	lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = {'clangd'},
	handlers = {
		function(server_name)
			require('lspconfig')[server_name].setup({})
		end,
	},
})

lsp_zero.set_preferences({
	sign_icons = { }
})

local lspconfig = require('lspconfig')
lspconfig.clangd.setup({
	cmd = { "clangd", "--background-index" },
	filetypes = { "c", "cpp", "objc", "objcpp" },
	root_dir = lspconfig.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git") or dirname,
	single_file_support = true,
	on_attach = function(client, bufnr)
		lsp_zero.default_keymaps({buffer = bufnr})
	end,
})
