local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local s = ls.snippet
local i = ls.insert_node
local f = ls.function_node

return{

       s("cp", fmt([[
            #include <bits/stdc++.h>
            using namespace std;

            #define forn(i,s,e) for(int i = (s); i<(e); i++)
            #define fori(i,s,e) for(int i = (s); i<=(e); i++)
            #define clean(v,e) memset(v,e,sizeof(v))
            #define all(x) x.begin(),x.end()
            #define debug(x) cout<< "x: " << (x) << "\n";

            int main(){{

                int T;
                scanf("%d", &T);

                while(T--){{
    
                }}

                
                return 0;
            }}
    
        ]],{}))

}
