local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local s = ls.snippet
local i = ls.insert_node
local f = ls.function_node

return{

       s("cp", fmt([[

            import java.util.Scanner;

            public class Main {{

                public static void main(String[] args) {{
                    Scanner scanner = new Scanner(System.in);
                    int T = scanner.nextInt();

                    while (T-- > 0) {{

                    }}

                    scanner.close();
                }}
            }}
    
        ]],{}))

}
