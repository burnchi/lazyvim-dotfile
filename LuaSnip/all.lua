local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local extras = require("luasnip.extras")
local rep = extras.rep
local fmt = require("luasnip.extras.fmt").fmt
local c = ls.choice_node
local f = ls.function_node
local d = ls.dynamic_node
local sn = ls.snippet_node

local file_pattern = "all"
ls.add_snippets(file_pattern, {
  s("log", {
    t("console.log("), i(1), t(")")
  })
})

-- 快速导包
ls.add_snippets("typescriptreact",{
  s("sty", {
    t("import styles from \"@/app/styles/"),i(1),t("\"")
  })
})
ls.add_snippets("typescriptreact",{
  s("sty1", {
    t("import styles from \"@/app/(dashboard)/styles/"),i(1),t("\"")
  })
})


