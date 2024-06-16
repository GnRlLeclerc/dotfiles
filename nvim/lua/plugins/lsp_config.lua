-- LSP setup

-- Run the organize imports command from tsserver
local function tsserver_organize_imports()
  local params = {
    command = '_typescript.organizeImports',
    arguments = { vim.api.nvim_buf_get_name(0) },
    title = '',
  }
  vim.lsp.buf.execute_command(params)
end

--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  -- Buffer local mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local builtin = require('telescope.builtin')
  vim.keymap.set('n', 'gr', builtin.lsp_references, { buffer = bufnr, desc = 'References' })
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = bufnr, desc = 'Declaration' })
  vim.keymap.set('n', 'gd', builtin.lsp_definitions, { buffer = bufnr, desc = 'Definitions' })
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr, desc = 'Hover' })
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = bufnr, desc = 'Code Action' })
  vim.keymap.set('n', 'gi', builtin.lsp_implementations, { buffer = bufnr, desc = 'Implementations' })
  vim.keymap.set('n', '<leader>ff', vim.lsp.buf.format, { buffer = bufnr, desc = 'Format' })
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = bufnr, desc = 'Rename' })
end

return {
  {
    'williamboman/mason.nvim',
    event = 'VeryLazy',
    config = function()
      require('mason').setup({ ui = { border = 'rounded' } })
    end,
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = { 'folke/neodev.nvim', 'b0o/SchemaStore.nvim', 'williamboman/mason-lspconfig.nvim' },
    event = 'VeryLazy',
    config = function()
      -- LSP CONFIGURATION
      -- List of LSP servers to install + configurations
      local servers = {
        texlab = {
          settings = {
            texlab = {
              diagnostics = {
                ignoredPatterns = { 'Overfull', 'Underfull' },
              },
            },
          },
        },
        lua_ls = true,
        rust_analyzer = true,
        angularls = true,
        bashls = true,
        clangd = true,
        cmake = true,
        cssls = true,
        dockerls = true,
        eslint = true,
        graphql = true,
        html = true,
        -- htmx = true,
        jsonls = {
          settings = {
            json = {
              schemas = require('schemastore').json.schemas(),
              validate = { enable = true },
            },
          },
        },
        jdtls = true,
        autotools_ls = true,
        marksman = true,
        pyright = true,
        somesass_ls = true,
        svelte = true,
        taplo = true,
        tailwindcss = true,
        tsserver = {
          on_attach = function(client, bufnr)
            -- On tsserver attach, add additional keymaps for organizing imports
            vim.keymap.set('n', '<leader>oi', tsserver_organize_imports, { buffer = bufnr })
            on_attach(client, bufnr)
          end,

          commands = {
            OrganizeImports = {
              tsserver_organize_imports,
              description = 'Organize Imports',
            },
          },
        },
        yamlls = {
          settings = {
            yaml = {
              schemaStore = {
                enable = false,
                url = '',
              },
              schemas = require('schemastore').yaml.schemas(),
            },
          },
        },
        -- TODO: gopls, sqls
      }

      -- Mason LSP installed servers
      require('neodev').setup()
      require('mason-lspconfig').setup({
        ensure_installed = servers,
      })

      local lspconfig = require('lspconfig')
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }

      -- Hook all servers
      for lsp, config in pairs(servers) do
        ---@diagnostic disable-next-line: redefined-local
        local config = (config == true) and {} or config
        config = vim.tbl_deep_extend('force', { capabilities = capabilities, on_attach = on_attach }, config)

        lspconfig[lsp].setup(config)
      end
    end,
  },
}
