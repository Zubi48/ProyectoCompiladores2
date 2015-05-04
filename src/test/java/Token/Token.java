
/**
 *El modelo contiene los elementos que conforman las ecppresion divididos en 
 * los elementos que describe el alfabeto y la gramatica
 * @author JULIO
 * @since 06-03-2015    
 * 
 */
public class Token {
  private Integer linea;
  private int token;
  private String lexema;
  /**
   * Constructor basico para generar tokens
   * @param linea posicion donde se localiza el lexema
   * @param token identificador numerico
   * @param lexema caracter o cadena de caracteres(valor real)
   */
  
  
  public Token(Integer linea, int token, String lexema){
      this.linea = linea;
      this.token = token;
      this.lexema = lexema;
  }

    public Integer getLinea() {
        return linea;
    }

    public int getToken() {
        return token;
    }

    public String getLexema() {
        return lexema;
    }

    public void setLinea(Integer linea) {
        this.linea = linea;
    }

    public void setToken(int token) {
        this.token = token;
    }

    public void setLexema(String lexema) {
        this.lexema = lexema;
    }
    /**
     * metodo que genera cadena con los elementos del token
     * 
     * @return cadema con el fomrato linea -----token---- lexema. 
     */
  @Override
  public String toString(){
      return String.format("%s----%s----%s",this.linea,this.token,this.lexema);
  }
}
