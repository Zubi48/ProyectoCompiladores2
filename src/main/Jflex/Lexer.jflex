import java.util.ArrayList;
import java.util.List;
import java.io.FileReader;
%%
%public
%class Lexer
%standalone
        
%{
            private List<String> tokens = new ArrayList<>();
%}
        

%{
            public List<String> analizar(String archivo){
    FileReader in = null;
    try{
    in = new FileReader(archivo);
    Lexer lexer = new Lexer(in);
    while(!lexer.zzAtEOF){
    lexer.yylex();
                        }
    }catch(Exception ex){
        System.out.println("Error al analizar el archivo.");
        }finally{
                try{
                       in.close();
                   }catch(Exception ex){
                    System.out.println("Error al cerrar el archivo");
                }
           }
                return tokens;
       }
%}
        
%%
[a-z][a-z0-9_A-Z]+ \'[.]*\'?{tokens.add("ATOMO"); System.out.println("ATOMO");}
\'[.]*\'? {tokens.add("ATOMO"); System.out.println("ATOMO");}
[`~!@#$%^&*()_°¬|+\-=?;:',.<>\{\}\[\]\\\/]*"{tokens.add("ATOMO"); System.out.println("ATOMO");}
[A-Z_][a-z0-9_A-Z]*{tokens.add("VARIABLE"); System.out.println("VARIABLE");}
[-+]?(\d{0,})(?:\.(\d{0,}))?{tokens.add("PTO_FIJO"); System.out.println("PTO_FIJO");}
^_[a-zA-Z] {tokens.add("ID"); System.out.println("IDENTIFICADOR");}
[a-zA-Z] {tokens.add("ID"); System.out.println("IDENTIFICADOR");}
["`~!@#$%^&*()_°¬|+\-=?;:',.<>\{\}\[\]\\\/a-zA-Z"] {tokens.add("CADENA"); System.out.println("CADENA");}
[+-d] {tokens.add("ENTERO"); System.out.println("ENTERO");}
