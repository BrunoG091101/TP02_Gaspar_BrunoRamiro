public class Dado extends GameObject {
  private PImage dado1;
  private PImage dado2;
  private PImage dado3;
  private PImage dado4;
  private PImage dado5;
  private PImage dado6;
  private int numeroDado;
  private int numerosLista=4;
  private int [] lista = new int [numerosLista];
  private int dadosLista=0;
  
  public Dado() {
  }
  
  public Dado(PVector posicion) {
    this.posicion=posicion;
  }
  
  public void tirarDado() {
    if(dadosLista<numerosLista) {
      println("Inicio de la lista");
      numeroDado=int(random(1,7));
      lista[dadosLista] = numeroDado;
      dadosLista++;
      for(int i=0; i<numerosLista; i++) {
        println("Numero dado: " + lista[i]);
      }
    } else {
      println("La lista está llena, genere una nueva");
    }
  }
  
  public void generarLista() {
    dadosLista=0;
    println("Se generó una nueva lista");
  }
  
  public void display() {
    dado1=loadImage("uno.jpg");
    dado2=loadImage("dos.jpg");
    dado3=loadImage("tres.jpg");
    dado4=loadImage("cuatro.jpg");
    dado5=loadImage("cinco.jpg");
    dado6=loadImage("seis.jpg");
    if(numeroDado==1) {
      imageMode(CENTER);
      image(dado1, posicion.x, posicion.y, 180, 180);
      String numero = "UNO";
      fill(0);
      textSize(40);
      textAlign(RIGHT, TOP);
      text(numero, width-20, 20);
    } else if(numeroDado==2) {
      imageMode(CENTER);
      image(dado2, posicion.x, posicion.y, 180, 180);
      String numero = "DOS";
      fill(0);
      textSize(40);
      textAlign(RIGHT, TOP);
      text(numero, width-20, 20);
    } else if(numeroDado==3) {
      imageMode(CENTER);
      image(dado3, posicion.x, posicion.y, 180, 180);
      String numero = "TRES";
      fill(0);
      textSize(40);
      textAlign(RIGHT, TOP);
      text(numero, width-20, 20);
    } else if(numeroDado==4) {
      imageMode(CENTER);
      image(dado4, posicion.x, posicion.y, 180, 180);
      String numero = "CUATRO";
      fill(0);
      textSize(40);
      textAlign(RIGHT, TOP);
      text(numero, width-20, 20);
    } else if(numeroDado==5) {
      imageMode(CENTER);
      image(dado5, posicion.x, posicion.y, 180, 180);
      String numero = "CINCO";
      fill(0);
      textSize(40);
      textAlign(RIGHT, TOP);
      text(numero, width-20, 20);
    } else if(numeroDado==6) {
      imageMode(CENTER);
      image(dado6, posicion.x, posicion.y, 180, 180);
      String numero = "SEIS";
      fill(0);
      textSize(40);
      textAlign(RIGHT, TOP);
      text(numero, width-20, 20);
    }
  }  
}
