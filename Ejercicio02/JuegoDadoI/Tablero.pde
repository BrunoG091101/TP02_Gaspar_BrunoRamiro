class Tablero extends GameObject {
  private Dado dado;
  private String numero;

  public Tablero(PVector posicion) {
    this.posicion=posicion;
  }
  
  
  public void display() {
    fill(#04B92F);
    rectMode(CENTER);
    rect(posicion.x,posicion.y,width-30,height-30);
  }
  
  public void mostrarDado(Dado dado) {
    this.dado=dado;
    dado.display();
  }
  
  public void mostrarTexto() {
    switch(dado.getNumeroDado()) {
      case 1:{
        numero = "UNO";
        fill(0);
        textSize(40);
        textAlign(RIGHT, TOP);
        text(numero, width-20, 20);
      break;  
      }
      
      case 2:{
        numero = "DOS";
        fill(0);
        textSize(40);
        textAlign(RIGHT, TOP);
        text(numero, width-20, 20);
      break;
      }
      
      case 3:{
        numero = "TRES";
        fill(0);
        textSize(40);
        textAlign(RIGHT, TOP);
        text(numero, width-20, 20);
      break;
      }
    
      case 4:{
        numero = "CUATRO";
        fill(0);
        textSize(40);
        textAlign(RIGHT, TOP);
        text(numero, width-20, 20);
      break;
      } 
      case 5:{
        numero = "CINCO";
        fill(0);
        textSize(40);
        textAlign(RIGHT, TOP);
        text(numero, width-20, 20);
      break;
      }
      case 6:{
        numero = "SEIS";
        fill(0);
        textSize(40);
        textAlign(RIGHT, TOP);
        text(numero, width-20, 20);
      break;
      }
    }
  }
}
