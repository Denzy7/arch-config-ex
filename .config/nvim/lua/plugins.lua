require('packer').startup(function(use)
    use 'wbthomason/packer.nvim' -- Package manager
    use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
    use 'hrsh7th/nvim-cmp' -- auto
    use 'hrsh7th/cmp-nvim-lsp' --lsp src
    use 'hrsh7th/cmp-nvim-lsp-signature-help' -- overloads?
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip' -- Snippets plugin
    use 'folke/tokyonight.nvim' --THEME: no one sleep at this place
    use 'nvim-tree/nvim-tree.lua' -- file manager
    use 'nvim-tree/nvim-web-devicons' -- file manager icons
    use 'preservim/nerdcommenter' -- commenter 🤷
    use 'tikhomirov/vim-glsl' --for glsl
    use 'RaafatTurki/hex.nvim' --hex edit
    use 'mfussenegger/nvim-jdtls' --jdtls
    use 'lukas-reineke/indent-blankline.nvim' -- working with python and yaml 🤷
    use 'FelipeLema/cmp-async-path' --paths
    use({"petertriho/cmp-git", requires = "nvim-lua/plenary.nvim"}) --git src
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
end)

function leave_snippet()
    if
        ((vim.v.event.old_mode == 's' and vim.v.event.new_mode == 'n') or vim.v.event.old_mode == 'i')
        and require('luasnip').session.current_nodes[vim.api.nvim_get_current_buf()]
        and not require('luasnip').session.jump_active
        then
            require('luasnip').unlink_current()
        end
    end


-- stop snippets when you leave to normal mode
vim.api.nvim_command([[ autocmd ModeChanged * lua leave_snippet() ]])

    -- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true
vim.cmd[[colorscheme tokyonight-night]]

vim.cmd[[filetype plugin on]] --for nerdcommenter

require('lualine').setup()

require('nvim-tree').setup()

require('hex').setup()
require("ibl").setup()

local lspconfig = require('lspconfig')
-- Add additional capabilities supported by nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'pylsp', 'cmake', 'gdscript', 'lua_ls', 'glslls'--[[, 'tsserver']]}
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        capabilities = capabilities
    }
end
-- manual clangd setup
lspconfig['clangd'].setup
{
    cmd = {
        "clangd",
        "-j=2",
        "--header-insertion=never",
        -- clangd with background index is a source of many problems!!! and will 
        -- slow down your machine, even with an ssd and lots of ram and cpu
        --"--background-index", 
        "--clang-tidy",
    },
    capabilities = capabilities
}

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },sources = {
      {name = 'nvim_lsp'},
      {name = 'nvim_lsp_signature_help' },
      {name = 'async_path' },
      { name = "git" },
      {name = 'luasnip'}
  },mapping = cmp.mapping.preset.insert(
  {
      ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
      ['<C-d>'] = cmp.mapping.scroll_docs(4), -- Down
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<CR>'] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
      },
      ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
      end, { 'i', 's' }),
      ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
      end, { 'i', 's' }),
  }
  )
}
require("cmp_git").setup()
--global --
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
   end,    
})
