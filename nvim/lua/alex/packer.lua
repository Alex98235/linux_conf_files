-- This file can be loaded by calling `lua require('plugins')` from your init.vim



-- Interesting Plugins:
-- https://github.com/NeogitOrg/neogit 





-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	
	-- Or with configuration
	use({
		'projekt0n/github-nvim-theme',
		config = function()
		
			require('github-theme').setup({
				options = {
					-- Compiled file's destination location
					compile_path = vim.fn.stdpath('cache') .. '/github-theme',
					compile_file_suffix = '_compiled', -- Compiled file suffix
					hide_end_of_buffer = true, -- Hide the '~' character at the end of the buffer for a cleaner look
					hide_nc_statusline = true, -- Override the underline style for non-active statuslines
					transparent = true,       -- Disable setting bg (make neovim's background transparent)
					terminal_colors = true,    -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
					dim_inactive = true,      -- Non focused panes set to alternative background
					module_default = true,     -- Default enable value for modules
					styles = {                 -- Style to be applied to different syntax groups
						comments = 'italic',       -- Value is any valid attr-list value `:help attr-list`
						functions = 'bold',
						keywords = 'NONE',
						variables = 'NONE',
						conditionals = 'NONE',
						constants = 'NONE',
						numbers = 'NONE',
						operators = 'NONE',
						strings = 'NONE',
						types = 'NONE',
					},
					inverse = {                -- Inverse highlight for different types
					match_paren = false,
					visual = false,
					search = false,
					},
					darken = {                 -- Darken floating windows and sidebar-like windows
						floats = true,
						sidebars = {
						enable = true,
						list = {},             -- Apply dark background to specific windows
						},
					},
				modules = {                -- List of various plugins and additional options
				-- ...
				},
				},
			palettes = {},
			specs = {},
			groups = {},
			})
			
		-- setup must be called before loading
		vim.cmd('colorscheme github_dark_dimmed')


		end
	})

	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}
   
	require('lualine').setup {
		options = {
			icons_enabled = true,
			theme = 'auto',
			component_separators = { left = '', right = ''},
			section_separators = { left = '', right = ''},
			disabled_filetypes = {
				statusline = {},
				winbar = {},
			},
			ignore_focus = {},
			always_divide_middle = true,
			globalstatus = false,
			refresh = {
				statusline = 1000,
				tabline = 1000,
				winbar = 1000,
			}
		},
		sections = {
			lualine_a = {'mode'},
			lualine_b = {'branch', 'diff', 'diagnostics'},
			lualine_c = {'filename'},
			lualine_x = {'encoding', 'fileformat', 'filetype'},
			lualine_y = {'progress'},
			lualine_z = {'location'}
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = {'filename'},
			lualine_x = {'location'},
			lualine_y = {},
			lualine_z = {}
		},
		tabline = {},
		winbar = {},
		inactive_winbar = {},
		extensions = {}
	}


	use('mbbill/undotree')
	use('tpope/vim-fugitive')

	
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v1.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{'williamboman/mason.nvim'},           -- Optional
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},         -- Required
			{'hrsh7th/cmp-nvim-lsp'},     -- Required
			{'hrsh7th/cmp-buffer'},       -- Optional
			{'hrsh7th/cmp-path'},         -- Optional
			{'saadparwaiz1/cmp_luasnip'}, -- Optional
			{'hrsh7th/cmp-nvim-lua'},     -- Optional

			-- Snippets
			{'L3MON4D3/LuaSnip'},             -- Required
			{'rafamadriz/friendly-snippets'}, -- Optional
		}
	}
   
   use({
      "utilyre/barbecue.nvim",
      tag = "*",
      requires = {
         "SmiteshP/nvim-navic",
         "nvim-tree/nvim-web-devicons", -- optional dependency
      },
      --after = "nvim-web-devicons", -- keep this if you're using NvChad
      config = function()
         require("barbecue").setup()
      end,
   })

   use {
      "danymat/neogen",
      config = function()
         require('neogen').setup {}
      end,
      -- Uncomment next line if you want to follow only stable versions
      -- tag = "*"
   }
end)
