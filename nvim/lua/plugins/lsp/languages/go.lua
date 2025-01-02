return function()
    sennvim.lsp.add_config('gopls', {
        settings = {
         gopls = {
                analyses = {
                    unusedparams = true,
                    unreachable = true,
                },
                staticcheck = true,
                usePlaceholders = true,
                completeUnimported = true,
            },
        },
    })

    sennvim.formatters.add_formatter('go', { 'gopls' })
end
