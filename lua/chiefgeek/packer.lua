-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]



return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or, branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    } 

--    use({
--        'rose-pine/neovim',
--        as = 'rose-pine',
--        config = function()
--            vim.cmd('colorscheme rose-pine')
--        end
--    })


use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'})
use('nvim-treesitter/playground')
use('theprimeagen/harpoon')
use('mbbill/undotree')
use('tpope/vim-fugitive')
use {'p00f/clangd_extensions.nvim', config = function() 
 local clangd_extensions =  require("clangd_extensions")
 clangd_extensions.setup()
 end
}
--use('navarasu/onedark.nvim')
use {'morhetz/gruvbox', config = function() vim.cmd.colorscheme("gruvbox") end }
use ("nvim-lua/plenary.nvim")
use {'Civitasv/cmake-tools.nvim', config = function()
    local cmake_tools = require('cmake-tools')
    cmake_tools.setup {
        cmake_command = "cmake", -- this is used to specify cmake command path
        cmake_regenerate_on_save = true, -- auto generate when save CMakeLists.txt
        cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" }, -- this will be passed when invoke `CMakeGenerate`
        cmake_build_options = { "-DCMAKE_TOOLCHAIN_FILE=/Users/jeremyevans/vcpkg/scripts/buildsystems/vcpkg.cmake" }, -- this will be passed when invoke `CMakeBuild`
        cmake_build_directory = "", -- this is used to specify generate directory for cmake
        cmake_build_directory_prefix = "cmake_build_", -- when cmake_build_directory is set to "", this option will be activated
        cmake_soft_link_compile_commands = true, -- this will automatically make a soft link from compile commands file to project root dir
        cmake_compile_commands_from_lsp = false, -- this will automatically set compile commands file location using lsp, to use it, please set `cmake_soft_link_compile_commands` to false
        cmake_kits_path = nil, -- this is used to specify global cmake kits path, see CMakeKits for detailed usage
        cmake_variants_message = {
            short = { show = true }, -- whether to show short message
            long = { show = true, max_length = 40 } -- whether to show long message
        },
        cmake_dap_configuration = { -- debug settings for cmake
        name = "cpp",
        type = "codelldb",
        request = "launch",
        stopOnEntry = false,
        runInTerminal = true,
        console = "integratedTerminal",
    },
    cmake_always_use_terminal = false, -- if true, use terminal for generate, build, clean, install, run, etc, except for debug, else only use terminal for run, use quickfix for others
    cmake_quickfix_opts = { -- quickfix settings for cmake, quickfix will be used when `cmake_always_use_terminal` is false
    show = "always", -- "always", "only_on_error"
    position = "belowright", -- "bottom", "top"
    size = 10,
},
cmake_terminal_opts = { -- terminal settings for cmake, terminal will be used for run when `cmake_always_use_terminal` is false or true, will be used for all tasks except for debug when `cmake_always_use_terminal` is true
name = "Main Terminal",
prefix_name = "[CMakeTools]: ", -- This must be included and must be unique, otherwise the terminals will not work. Do not use a simple spacebar " ", or any generic name
split_direction = "horizontal", -- "horizontal", "vertical"
split_size = 11,

-- Window handling
single_terminal_per_instance = true, -- Single viewport, multiple windows
single_terminal_per_tab = true, -- Single viewport per tab
keep_terminal_static_location = true, -- Static location of the viewport if avialable

-- Running Tasks
start_insert_in_launch_task = false, -- If you want to enter terminal with :startinsert upon using :CMakeRun
start_insert_in_other_tasks = false, -- If you want to enter terminal with :startinsert upon launching all other cmake tasks in the terminal. Generally set as false
focus_on_main_terminal = false, -- Focus on cmake terminal when cmake task is launched. Only used if cmake_always_use_terminal is true.
focus_on_launch_terminal = false, -- Focus on cmake launch terminal when executable target in launched.
  }
}
    end
}
use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},             -- Required
        {                                      -- Optional
        'williamboman/mason.nvim',
        run = function()
            pcall(vim.cmd, 'MasonUpdate')
        end,
    },
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

    {'neoclide/coc.nvim', branch = 'release'},
}
}

use {
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
}


use { 'alexghergh/nvim-tmux-navigation', config = function()

        local nvim_tmux_nav = require('nvim-tmux-navigation')

        nvim_tmux_nav.setup {
            disable_when_zoomed = true -- defaults to false
        }

        vim.keymap.set('n', "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
        vim.keymap.set('n', "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
        vim.keymap.set('n', "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
        vim.keymap.set('n', "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
        vim.keymap.set('n', "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
        vim.keymap.set('n', "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)

    end
}

end)

