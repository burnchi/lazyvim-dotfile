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

local file_pattern = "typescriptreact"
-- 箭头函数1  可以修改分割符号,自动补全
ls.add_snippets(file_pattern, {

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
  -- 导出的箭头函数
  s(
    {
      trig = "ecafe",
      desc = "export default arrow function"
    },
    fmt(
      [[
      const {} = ({}) => {{
         {}
      }}
      export default {}
  ]],
      {
        -- func name always same as export name
        d(1, function()
          return sn(1, i(1, ""))
        end),
        i(2, ""),
        i(3, ""),
        rep(1)
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
  -- 匿名函数
  s(
    {
      trig = "afr",
      desc = "anno arrow function"

    },
    fmt(
      [[
    ({}) => {{
      {}

      return ({})
    }}
  ]],
      {
        -- choice_node
        c(1, { t(""), t("item"), t("item,idx") }),
        i(2, "Todo1"),
        i(3, "Todo2"),
      }
    )
  ),
  -- 组件类型定义
  s(
    {
      trig = "interComp",
      desc = "type save Interface"

    },
    fmt(
      [[
interface {}{{
  {}
}}
  ]],
      {
        i(1, ""),
        c(2, {
          t(""),
          -- 自定义组件类型
          sn(1, { t({ "children: React.ReactNode;", "  className?: string;" }), i(1, "") })
        })
      }
    )
  ),
  -- twmerge样式合并
  s(
    {
      trig = "twmerge",
      desc = "Quick Use twMerge"

    },
    fmt(
      [[
    twMerge("{}", className)
  ]],
      {
        i(1, ""),
      }
    )
  ),
  -- twmerge样式合并
  s(
    {
      trig = "cl",
      desc = "Console log"

    },
    fmt(
      [[
      console.log("{}")
  ]],
      {
        i(1, ""),
      }
    )
  ),
  -- 合并空尖括号
  s(
    "<>",
    {
      t("<>"),
      i(1, ""),
      t("</>")
    }
  ),
  -- container const {container} = styles
  s(
    "cont",
    {
      t("const { container } = styles"),
    }
  ),

})
