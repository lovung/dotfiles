local has_lsp, _ = pcall(require, 'lspconfig')
if not has_lsp then
    return
end

local on_attach = function(client, bufnr)
    local filetype = vim.api.nvim_buf_get_option(0, 'filetype')

    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    --Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings
    local opts = { noremap=true, silent=true }
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<leader>lD', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<leader>lh', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', '<leader>lh', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    -- buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    -- buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    -- buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<leader>lc', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', '<leader>ld', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  

    --      automatic formatting
    if vim.tbl_contains({"go"}, filetype) then
        vim.cmd [[autocmd BufWritePre <buffer> :lua vim.lsp.buf.formatting_sync()]]
        vim.cmd [[autocmd BufWritePre <buffer> :lua require('scnewma.lsp').goimports(1000)]]
    end
end

-- Configure lua language server for neovim development
local lua_settings = {
    Lua = {
        runtime = {
            -- LuaJIT for neovim
            version = 'LuaJIT',
            path = vim.split(package.path, ';'),
        },
        diagnostics = {
            -- get the language server to recognize the `vim` global
            globals = {'vim'},
        },
        workspace = {
            -- make the server aware of neovim runtime files
            library = {
                [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
            },
        },
    }
}

local go_settings = {
    gopls = {
        codelenses = { test = true },
    }
}

-- config that activets keymaps and enabled snippet support
local function make_config()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.snippetSupport = true
    capabilities.textDocument.codeLens = { dynamicRegistration = false }
    return {
        capabilities = capabilities,
        on_attach = on_attach,
    }
end

-- this is a hack to override lspinstalls builtin function for checking if a
-- server is installed. the builtin function executes an os command to verify
-- that the server is installed in the expected directory and is executable,
-- which works as expected but is extremely slow. this patch lowered my startup
-- time from 300ms to 100ms
local installed_servers = { bash=true, dockerfile=true, go=true, json=true, lua=true, python=true, vim=true, yaml=true }
require('lspinstall').is_server_installed = function(lang)
    return installed_servers[lang]
end

local function setup_servers()
    require('lspinstall').setup()

    local servers = require('lspinstall').installed_servers()

    for _, server in pairs(servers) do
        local config = make_config()

        -- language specific config
        if server == "lua" then
            config.settings = lua_settings
        end
        if server == "go" then
            config.settings = go_settings
        end

        require('lspconfig')[server].setup(config)
    end
end

setup_servers()

-- automatically reload after `:LspInstall <server>` so we don't have to
-- restart neovim
require('lspinstall').post_install_hook = function()
    setup_servers() -- reload installed servers
    vim.cmd("bufdo e") -- triggers the FileType autocmd that starts the server
end

require "lsp_signature".setup({
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    handler_opts = {
      border = "single"
    }
})

local M = {}

-- use lspinstall to install all servers in the installed_servers table
function M.install_servers()
    for server in pairs(installed_servers) do
        require('lspinstall').install_server(server)
    end
end

-- Source: https://github.com/neovim/nvim-lspconfig/issues/115#issuecomment-656372575
function M.goimports(timeout_ms)
    local context = { source = { organizeImports = true } }
    vim.validate { context = { context, "t", true } }
    local params = vim.lsp.util.make_range_params()
    params.context = context

    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeout_ms)
    if not result then return end
    result = result[1].result
    if not result then return end
    local edit = result[1].edit
    vim.lsp.util.apply_workspace_edit(edit)
end

return M
