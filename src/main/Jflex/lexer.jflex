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
[a-z][a-z0-9_A-Z]+                		{tokens.add("ATOMO"); System.out.println("ATOMO Minuscula");}
(['].*['])                                      {tokens.add("ATOMO"); System.out.println("ATOMO Apostrofes");}
[^A-Za-z0-9\s]+                                 {tokens.add("ATOMO"); System.out.println("ATOMO Especiales");}
^[A-Z_][a-z0-9_A-Z]+                            {tokens.add("VARIABLE"); System.out.println("VARIABLE");}