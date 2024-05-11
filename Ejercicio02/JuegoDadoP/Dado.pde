public class Dado extends GameObject {
  private int numeroDado;
  private int numerosLista=4;
  private int [] lista = new int [numerosLista];
  private int dadosLista=0;
  
  public Dado() {
  }
  
  public Dado(PVector posicion) {
    this.posicion=posicion;
  }
  
  public int getNumeroDado() {
    return this.numeroDado;
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
    strokeWeight(1);
    fill(255);
    rect(posicion.x, posicion.y, 180, 180);
    if(numeroDado==1) {
      strokeWeight(25);
      point(posicion.x, posicion.y);
    } else if(numeroDado==2) {
      strokeWeight(25);
      point(posicion.x+45, posicion.y-45);
      point(posicion.x-45, posicion.y+45);
    } else if(numeroDado==3) {
      strokeWeight(25);
      point(posicion.x+45, posicion.y-45);
      point(posicion.x, posicion.y);
      point(posicion.x-45, posicion.y+45);
    } else if(numeroDado==4) {
      strokeWeight(25);
      point(posicion.x-45, posicion.y-45);
      point(posicion.x+45, posicion.y-45);
      point(posicion.x-45, posicion.y+45);
      point(posicion.x+45, posicion.y+45);
    } else if(numeroDado==5) {
      strokeWeight(25);
      point(posicion.x-45, posicion.y-45);
      point(posicion.x+45, posicion.y-45);
      point(posicion.x, posicion.y);
      point(posicion.x-45, posicion.y+45);
      point(posicion.x+45, posicion.y+45);
    } else if(numeroDado==6) {
      strokeWeight(25);
      point(posicion.x-45, posicion.y-45);
      point(posicion.x+45, posicion.y-45);
      point(posicion.x-45, posicion.y);
      point(posicion.x+45, posicion.y);
      point(posicion.x-45, posicion.y+45);
      point(posicion.x+45, posicion.y+45);
    }
  }  
}
