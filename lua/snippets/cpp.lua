local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local s = ls.snippet
local i = ls.insert_node
local f = ls.function_node

return{

       s("cp", fmt([[
            #include <bits/stdc++.h>
            using namespace std;

    
            int main(){{

                int T;
                scanf("%d", &T);

                while(T--){{
    
                }}

                
                return 0;
            }}
    
        ]],{}))

}
