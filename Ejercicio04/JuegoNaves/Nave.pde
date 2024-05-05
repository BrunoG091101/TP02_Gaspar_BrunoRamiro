public class Nave implements IDisplayable, IController, IMoveable {
  private PImage jugador1;
  private PImage jugador2;
  private PVector posicionJugador1;
  private PVector velocidadJugador1;
  private PVector posicionJugador2;
  private PVector velocidadJugador2;
  private boolean arribaJugador1;
  private boolean izquierdaJugador1;
  private boolean abajoJugador1;
  private boolean derechaJugador1;
  private boolean arribaJugador2;
  private boolean izquierdaJugador2;
  private boolean abajoJugador2;
  private boolean derechaJugador2;
  
  public Nave() {
  }
  
  public PVector getPosicionJugador1() {
    return this.posicionJugador1;
  }
  
  public void setPosicionJugador1(PVector posicionJugador1) {
    this.posicionJugador1=posicionJugador1;
  }
  
  public PVector getVelocidadJugador1() {
    return this.velocidadJugador1;
  }
  
  public void setVelocidadJugador1(PVector velocidadJugador1) {
    this.velocidadJugador1=velocidadJugador1;
  }
  
  public PVector getPosicionJugador2() {
    return this.posicionJugador2;
  }
  
  public void setPosicionJugador2(PVector posicionJugador2) {
    this.posicionJugador2=posicionJugador2;
  }
  
  public PVector getVelocidadJugador2() {
    return this.velocidadJugador2;
  }
  
  public void setVelocidadJugador2(PVector velocidadJugador2) {
    this.velocidadJugador2=velocidadJugador2;
  }
  
  public void display() {
    jugador1 = loadImage("nave1.png");
    image(jugador1, posicionJugador1.x, posicionJugador1.y, 120, 120);
    jugador2 = loadImage("nave2.png");
    image(jugador2, posicionJugador2.x, posicionJugador2.y, 120, 120);
  }
  
  public void mover() {
    if(arribaJugador1==true) {
      posicionJugador1.y-=velocidadJugador1.y;
    } else if(izquierdaJugador1==true) {
      posicionJugador1.x-=velocidadJugador1.x;
    } else if(abajoJugador1==true) {
      posicionJugador1.y+=velocidadJugador1.y;
    } else if(derechaJugador1==true) {
      posicionJugador1.x+=velocidadJugador1.x;
    }
    
    if(arribaJugador2==true) {
      posicionJugador2.y-=velocidadJugador2.y;
    } else if(izquierdaJugador2==true) {
      posicionJugador2.x-=velocidadJugador2.x;
    } else if(abajoJugador2==true) {
      posicionJugador2.y+=velocidadJugador2.y;
    } else if(derechaJugador2==true) {
      posicionJugador2.x+=velocidadJugador2.x;
    }
  }
  
  public void readCommand() {
    if(keyPressed) {
      if(key=='w' || key=='W') {
        arribaJugador1=true;
        abajoJugador1=false;
        izquierdaJugador1=false;
        derechaJugador1=false;
      } else if(key=='a' || key=='A') {
        izquierdaJugador1=true;
        derechaJugador1=false;
        arribaJugador1=false;
        abajoJugador1=false;
      } else if(key=='s' || key=='S') {
        abajoJugador1=true;
        arribaJugador1=false;
        izquierdaJugador1=false;
        derechaJugador1=false;
      } else if(key=='d' || key=='D') {
        derechaJugador1=true;
        izquierdaJugador1=false;
        arribaJugador1=false;
        abajoJugador1=false;
      }
      
      if(keyCode==UP) {
        arribaJugador2=true;
        abajoJugador2=false;
        izquierdaJugador2=false;
        derechaJugador2=false;
      } else if(keyCode==LEFT) {
        izquierdaJugador2=true;
        derechaJugador2=false;
        arribaJugador2=false;
        abajoJugador2=false;
      } else if(keyCode==DOWN) {
        abajoJugador2=true;
        arribaJugador2=false;
        izquierdaJugador2=false;
        derechaJugador2=false;
      } else if(keyCode==RIGHT) {
        derechaJugador2=true;
        izquierdaJugador2=false;
        arribaJugador2=false;
        abajoJugador2=false;
      }
    } else {
      arribaJugador1=false;
      abajoJugador1=false;
      izquierdaJugador1=false;
      derechaJugador1=false;
      arribaJugador2=false;
      abajoJugador2=false;
      izquierdaJugador2=false;
      derechaJugador2=false;
    }
  }
}
