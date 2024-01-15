local ls = require("luasnip")
local s, t, i, c, r, f, sn =
    ls.snippet, ls.text_node, ls.insert_node, ls.choice_node, ls.restore_node, ls.function_node, ls.snippet_node
local fmt = require("luasnip.extras.fmt").fmt

local snippets = {
    s(
        "bash",
        fmt(
            [[
#!/bin/sh

{}
    ]],
            i(0)
        )
    ),
}

return snippets
