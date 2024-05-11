class Dado extends GameObject {
  private int numeroDado;
  private int numerosLista=4;
  private int [] lista = new int [numerosLista];
  private int dadosLista;
  private PImage dado1;
  private PImage dado2;
  private PImage dado3;
  private PImage dado4;
  private PImage dado5;
  private PImage dado6;
  
  public Dado() {
    dadosLista=0;
  }
  
  public Dado(PVector posicion) {
    this.posicion=posicion;
  }
  
  public int getNumeroDado() {
    return this.numeroDado;
  }
    
  public void setNumeroDado(int numeroDado) {
    this.numeroDado=numeroDado;
  }
  
  public void display() {
  if(numeroDado==1) {
      dado1=loadImage("uno.jpg");
      imageMode(CENTER);
      image(dado1, posicion.x, posicion.y, 180, 180);
    } else if(numeroDado==2) {
      dado2=loadImage("dos.jpg");
      imageMode(CENTER);
      image(dado2, posicion.x, posicion.y, 180, 180);
    } else if(numeroDado==3) {
      dado3=loadImage("tres.jpg");
      imageMode(CENTER);
      image(dado3, posicion.x, posicion.y, 180, 180);
    } else if(numeroDado==4) {
      dado4=loadImage("cuatro.jpg");
      imageMode(CENTER);
      image(dado4, posicion.x, posicion.y, 180, 180);
    } else if(numeroDado==5) {
      dado5=loadImage("cinco.jpg");
      imageMode(CENTER);
      image(dado5, posicion.x, posicion.y, 180, 180);
    } else if(numeroDado==6) {
      dado6=loadImage("seis.jpg");
      imageMode(CENTER);
      image(dado6, posicion.x, posicion.y, 180, 180);
    }
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
}
