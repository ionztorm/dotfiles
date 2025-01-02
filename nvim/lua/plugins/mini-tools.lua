return {
    {
        'echasnovski/mini.nvim',
        config = function()
            local statusline = require('mini.statusline')
            local pairs = require('mini.pairs')
            local indentscope = require('mini.indentscope')
            local cursorword = require('mini.cursorword')
            local hipatterns = require('mini.hipatterns')


            statusline.setup { use_icons = true }
            pairs.setup({
                modes = { insert = true, command = true, terminal = false },
                skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
                skip_ts = { "string" },
                skip_unbalanced = true,
                markdown = true,
            })
            indentscope.setup({
                symbol = "│",
                options = { try_as_border = true },
            })
            cursorword.setup()
            hipatterns.setup({
                highlighters = {
                    hex_color = hipatterns.gen_highlighter.hex_color(),
                },
            })
        end
    },
}
