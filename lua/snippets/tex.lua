local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local s = ls.snippet
local i = ls.insert_node
local f = ls.function_node

ls.filetype_extend("markdown", {"tex"})


return {

  -- Function snippet
  s("func", fmt([[
    \begin{{equation}}
        f(x) = {} \\
        f(x)
    \end{{equation}}
  ]], { i(1, "x^2") })),

  -- Matrix snippet (static)
  s("mat", fmt([[
    \begin{{bmatrix}}
        {}
    \end{{bmatrix}}
  ]], { i(1, "a & b \\\\ c & d") })),

  s("casewise", fmt([[
    {}(x) =
    \begin{{cases}}
        {} & \text{{si }} {} \\
        {} & \text{{si }} {} \\
        {} & \text{{cc}}
    \end{{cases}}
  ]], {
    i(1, "f"),   -- Function name
    i(2, "expression_1"), -- First case expression
    i(3, "condition_1"),  -- First case condition
    i(4, "expression_2"), -- Second case expression
    i(5, "condition_2"),  -- Second case condition
    i(6, "expression_3"), -- Third case expression
  })),

  -- Dynamic matrix snippet



}
