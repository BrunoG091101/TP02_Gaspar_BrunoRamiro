import ddf.minim.*;

private Minim minim;
private AudioPlayer musicaMenu;
private AudioPlayer musicaJuego;
private Shooter shooter;
private JoyPad joyPad;
private HUD hud;
private Asteroide[] asteroides;
private boolean menu;
private boolean naveViva;
private boolean naveVisible; // Aún no encuentro en dónde implementar esta variable
private boolean turboVisible;
private boolean inmunidadNave;
private int inicioInmunidad;
private int duracionInmunidad;
private int inicioTurbo;
private int duracionTurbo;
private int cantAsteroides;
private int tiempoAsteroide;
private PImage fondoMenu;

public void setup() {
  size(1400, 800);
  minim = new Minim(this);
  musicaMenu = minim.loadFile("menuShooter.mp3");
  musicaJuego = minim.loadFile("juegoShooter.mp3");
  shooter = new Shooter(new PVector(50, height/2), new PVector(10, 10));
  joyPad = new JoyPad();
  menu = true;
  naveViva = true;
  turboVisible = false;
  inmunidadNave = false;
  duracionInmunidad = 1500;
  inicioTurbo = 0;
  duracionTurbo = 500;
  asteroides = new Asteroide[7];
  cantAsteroides = 0;
}

public void draw() {
  background(0);
  if(menu) {
    mostrarPantalla(0);
  } else {
    mostrarPantalla(1);
    musicaJuego.play();
    if(musicaJuego.position()>=musicaJuego.length()) {
    musicaJuego.rewind();
    }
  }
}

public void mostrarPantalla(int pantalla) { // Método que sirve para cambiar de pantalla
  switch(pantalla) {
    case 0:{
      fondoMenu=loadImage("fondoMenu.jpg");
      imageMode(CENTER);
      image(fondoMenu, width/2, height/2);
      musicaMenu.play();
      if(musicaMenu.position()>=musicaMenu.length()) {
        musicaMenu.rewind();
      }
    break;
    }
    
    case 1:{
      if(joyPad.isUpPressed()) {
        shooter.mover(0);
      }
      if(joyPad.isLeftPressed()) {
        shooter.mover(1);
      }
      if(joyPad.isDownPressed()) {
        shooter.mover(2);
      }
      if(joyPad.isRightPressed()) {
        shooter.mover(3);
      }
      if(joyPad.isBoost()) {
        if(turboVisible) {
          if(millis() - inicioTurbo < duracionTurbo) {
            shooter.mover(4);
          } else {
            turboVisible = false;
          }
        }
      }
  
      if(millis() - tiempoAsteroide >= 200 && cantAsteroides < 7) {
        tiempoAsteroide = millis();
        asteroides[cantAsteroides++] = new Asteroide(new PVector(width, random(30, height-30)), new PVector(25, 0));
      }
    
      if(naveViva) {
        shooter.display();
      for(int i = 0; i < cantAsteroides; i++) {
        Asteroide asteroide = asteroides[i];
        asteroide.display();
        asteroide.mover(0);
      
        // Comprobación de colisión entre la nave y el asteroide
        if(!inmunidadNave && colisionNave(shooter.posicion.x, shooter.posicion.y, 150, 75, asteroide.posicion.x, asteroide.posicion.y, 150, 75)) {
          naveViva = false;
          inmunidadNave = true; // Al colisionar la nave, después de aparecer será inmune por un breve periodo de tiempo
          inicioInmunidad = millis();
        }
      
        // Elimina los asteroides que salieron de la pantalla
        if(asteroide.posicion.x < 0) {
          for(int j = i; j < cantAsteroides - 1; j++) {
            asteroides[j] = asteroides[j + 1];
          }
          cantAsteroides--;
          i--;
        }
      }
      
      if(millis() - inicioInmunidad >= duracionInmunidad) {
        inmunidadNave = false; // Al pasar la duración establecida de inmunidad de la nave, se la desactiva
      }
      } else {
        // Cuando la nave se destruye, se verifica si pasó el tiempo de reaparición para regenerar la nave
        //if (millis() - tiempoNaveDestruida >= tiempoReaparicion) {
        // Restablece de la nave a su posición y estado iniciales
        shooter = new Shooter(new PVector(50, height/2), new PVector(10, 10));
        naveViva = true;
        //}
      }
    break;
    }
  }
}

public boolean colisionNave(float x1, float y1, int w1, int h1, float x2, float y2, int w2, int h2) {
  if (x1 + w1 < x2 || x1 > x2 + w2 || y1 + h1 < y2 || y1 > y2 + h2) {
    return false; // No hay colisión
  } else {
    return true; // Hay colisión
  }
}

public void keyPressed() {
  if(keyCode==ENTER) {
    menu = false;
    musicaMenu.close();
  }
  
  if(keyCode==UP) {
    joyPad.setUpPressed(true);
  }
  
  if(keyCode==LEFT) {
    joyPad.setLeftPressed(true);
  }
  
  if(keyCode==DOWN) {
    joyPad.setDownPressed(true);
  }
  
  if(keyCode==RIGHT) {
    joyPad.setRightPressed(true);
  }
  
  if(key=='z' || key=='Z') {
    joyPad.setBoost(true);
    turboVisible = true;
    inicioTurbo = millis();
  }
  
}

public void keyReleased() {
  if(keyCode==UP) {
    joyPad.setUpPressed(false);
  }
  
  if(keyCode==LEFT) {
    joyPad.setLeftPressed(false);
  }
  
  if(keyCode==DOWN) {
    joyPad.setDownPressed(false);
  }
  
  if(keyCode==RIGHT) {
    joyPad.setRightPressed(false);
  }
}
