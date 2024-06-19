local ls = require("luasnip") --{{{
local s = ls.s
local i = ls.i
local t = ls.t

local d = ls.dynamic_node
local c = ls.choice_node
local f = ls.function_node
local sn = ls.snippet_node

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local file_pattern = "typescript"

ls.add_snippets(file_pattern, {
  s(
    {
      trig = "ecafe",
      desc = "export arrow function"
    },
    fmt(
      [[
      export const {} = async ({}) => {{
         {}
      }}
  ]],
      {
        -- func name always same as export name
        d(1, function()
          return sn(1, i(1, ""))
        end),
        i(2, ""),
        i(3, "")
      }
    )
  ),
  s(
    {
      trig = "cafe",
      desc = "entire arrow function",
    },
    fmt(
      [[
      const {} = ({}) => {{
         {}
      }}
  ]],
      {
        -- i(1) is at nodes[1], i(2) at nodes[2].
        i(1, ""),
        i(2, ""),
        i(3, ""),
      }
    )
  ),
  -- 半箭头函数
  s(
    {
      trig = "af",
      desc = "half arrow function"

    },
    fmt(
      [[
    ({}) => {}
  ]],
      {
        -- choice_node
        c(1, { t(""), t("item"), t("item,idx") }),
        i(2, ""),
      }
    )
  ),
  -- constructor
  s(
    {
      trig = "const1",
      desc = "constructor function"

    },
    {
      t("constructor("), i(1, ""), t(')'), t("{}")
    }
  )

})
