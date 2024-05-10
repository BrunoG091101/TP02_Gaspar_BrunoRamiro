class Nave implements IDisplayable, IController, IMoveable {
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
  private Bala[] balasJugador1;
  private PImage balaJ1;
  private int indiceBalasJ1;
  private Bala[] balasJugador2;
  private PImage balaJ2;
  private int indiceBalasJ2;
  private int millisIniciales; // Con "millis" se refiere a milisegundos
  
  public Nave() {
    balasJugador1 = new Bala[100];
    indiceBalasJ1 = 0;
    balasJugador2 = new Bala[150];
    indiceBalasJ2 = 0;
    millisIniciales = millis();
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
    imageMode(CENTER);
    image(jugador1, posicionJugador1.x, posicionJugador1.y, 120, 120);
    jugador2 = loadImage("nave2.png");
    imageMode(CENTER);
    image(jugador2, posicionJugador2.x, posicionJugador2.y, 120, 120);
  }
  
  public void readCommand() {
    if(keyPressed) {
      
      // Si el jugador 1 presiona una de las siguientes teclas, el programa las leerá y aplicará el caso correspondiente. Si no se está presionando ninguna tecla, no hará nada
      
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
      
      // Si el jugador 2 presiona una de las siguientes teclas, el programa las leerá y aplicará el caso correspondiente. Si no se está presionando ninguna tecla, no hará nada
      
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
  
  public void mover() {
    
    int millisActuales = millis();
    float deltaTime = (millisActuales - millisIniciales) / 1000.0;
    
    // Según sea el caso, la nave del jugador 1 se moverá a la dirección indicada
    
    if(arribaJugador1==true) {
      posicionJugador1.y-=velocidadJugador1.y*deltaTime;
    } else if(izquierdaJugador1==true) {
      posicionJugador1.x-=velocidadJugador1.x*deltaTime;
    } else if(abajoJugador1==true) {
      posicionJugador1.y+=velocidadJugador1.y*deltaTime;
    } else if(derechaJugador1==true) {
      posicionJugador1.x+=velocidadJugador1.x*deltaTime;
    }
    
    // Según sea el caso, la nave del jugador 2 se moverá a la dirección indicada
    
    if(arribaJugador2==true) {
      posicionJugador2.y-=velocidadJugador2.y*deltaTime;
    } else if(izquierdaJugador2==true) {
      posicionJugador2.x-=velocidadJugador2.x*deltaTime;
    } else if(abajoJugador2==true) {
      posicionJugador2.y+=velocidadJugador2.y*deltaTime;
    } else if(derechaJugador2==true) {
      posicionJugador2.x+=velocidadJugador2.x*deltaTime;
    }
    
    millisIniciales = millisActuales;
  }
  
  public void dispararBalasJ1(Bala[] balasJugador1) {
    
    if(keyPressed && (key=='t' || key=='T')) {
      balasJugador1[indiceBalasJ1++] = new Bala(new PVector(posicionJugador1.x, posicionJugador1.y-80), new PVector(0, 75), balaJ1); // Agregación de una nueva bala a la lista balasJugador1 cada que se presiona la tecla "T"
    }
    
    for(int i=0; i<indiceBalasJ1; i++) {
      Bala listaBalas1=balasJugador1[i];
      balaJ1 = loadImage("bala1.png");
      imageMode(CENTER);
      image(balaJ1, listaBalas1.posicion.x, listaBalas1.posicion.y, 50, 50);
      listaBalas1.posicion.y-=listaBalas1.velocidad.y;
      
      if(listaBalas1.posicion.y < -100) {
        for(int j=i; j<indiceBalasJ1-1; j++) {
          balasJugador1[j] = balasJugador1[j+1]; // Esta iteración for se instancia para ajustar el indice de las balas tanto del jugador 1 como del jugador 2, haciendo que ninguna se siga mostrando aún después de pasar el límite
        }
      indiceBalasJ1--;
      i--;
      }
    }
  }
  
  public void dispararBalasJ2(Bala[] balasJugador2) {
    
    if(keyPressed && (key=='p' || key=='P')) {
      balasJugador2[indiceBalasJ2++] = new Bala(new PVector(posicionJugador2.x, posicionJugador2.y-60), new PVector(0, 45), balaJ2); // Agregación de una nueva bala a la lista balasJugador2 cada que se presiona la tecla "P"
    }
    
    for(int i=0; i<indiceBalasJ2; i++) {
      Bala listaBalas2=balasJugador2[i];
      balaJ2 = loadImage("bala2.png");
      imageMode(CENTER);
      image(balaJ2, listaBalas2.posicion.x, listaBalas2.posicion.y, 40, 40);
      listaBalas2.posicion.y-=listaBalas2.velocidad.y;
      
      if(listaBalas2.posicion.y < -100) {
        for(int j=i; j<indiceBalasJ2-1; j++) {
          balasJugador2[j] = balasJugador2[j+1]; // Iteración for que ajusta el indice de las balas del jugador 2 cuando éstas salen de la pantalla
        }
      indiceBalasJ2--;
      i--;
      }
    }
  }
}
