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
            #define forr(i,s,e) for(int i = (s); i>=(e); i--)
            #define clean(v,e) memset(v,e,sizeof(v))
            #define all(x) x.begin(),x.end()
            #define debug(x) cout<< "x: " << (x) << "\n";
            #define pii pair<int,int>
            #define vi vector<int>
            #define vii vector<pair<int,int>
            #define fastio ios_base::sync_with_stdio(0);cin.tie(0);cout.tie(0);

            #define MAXN 200005


            int main(){{

                int T;
                scanf("%d", &T);

                while(T--){{
    
                }}

                
                return 0;
            }}
    
        ]],{}))

}
