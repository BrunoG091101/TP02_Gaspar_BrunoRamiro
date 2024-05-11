import ddf.minim.*;

private Minim minim;
private AudioPlayer musicaMenu;
private AudioPlayer musicaJuego;
private AudioPlayer musicaFinJuego;
private Shooter shooter;
private JoyPad joyPad;
private HUD hud;
private Asteroide[] asteroides;
private boolean menu;
private boolean textoMenuVis;
private boolean inicioJuego;
private boolean finJuego;
private boolean naveViva;
private boolean turboVisible;
private boolean inmunidadNave;
private int framesPorSegundo;
private float deltaTime;
private int inicioInmunidad;
private int duracionInmunidad;
private int inicioTurbo;
private int duracionTurbo;
private int cantAsteroides;
private int tiempoAsteroide;
private PImage fondoMenu;
private PImage fondoJuego;
private PImage iconoVida;
private PImage fondoReintentar;

public void setup() {
  size(1400, 800);
  frameRate(10);
  minim = new Minim(this);
  musicaMenu = minim.loadFile("menuShooter.mp3");
  musicaJuego = minim.loadFile("juegoShooter.mp3");
  musicaFinJuego = minim.loadFile("musicaFinJuego.mp3");
  shooter = new Shooter(new PVector(50, height/2), new PVector(200, 200));
  joyPad = new JoyPad();
  hud = new HUD(shooter);
  hud.asignarVidas(4);
  menu = true;
  textoMenuVis = true;
  inicioJuego = false;
  finJuego = false;
  naveViva = true;
  turboVisible = false;
  inmunidadNave = false;
  duracionInmunidad = 1500;
  inicioTurbo = 0;
  duracionTurbo = 500;
  asteroides = new Asteroide[6];
  cantAsteroides = 0;
}

public void draw() {
  framesPorSegundo = round(frameRate);
  deltaTime = 1.0/framesPorSegundo;
  if(menu==true) {
    mostrarPantalla(0);
    musicaMenu.play();
    if(textoMenuVis==true) {
      textSize(50);
      textAlign(CENTER);
      text("Presione ENTER para comenzar", width/2, height/2+320);
    }
    
    //Iteración para darle un efecto de parpadeo al texto del menú principal
    
    if (frameCount % 10 < 5) {
      textoMenuVis=true;
    } else {
      textoMenuVis=false;
    }
    
    if(musicaMenu.position()>=musicaMenu.length()) {
      musicaMenu.rewind();
    }
  } else if(inicioJuego==true && finJuego==false) {
      mostrarPantalla(1);
      musicaJuego.play();
      if(musicaJuego.position()>=musicaJuego.length()) {
        musicaJuego.rewind();
      }
      iconoVida=loadImage("iconoVida.png");
      imageMode(CENTER);
      image(iconoVida, 30, 30, 50, 50);
      hud.mostrarVidas();
      if(joyPad.isUpPressed() && shooter.posicion.y>80) {
        shooter.mover(0, deltaTime);
      }
      if(joyPad.isLeftPressed() && shooter.posicion.x>130) {
        shooter.mover(1, deltaTime);
      }
      if(joyPad.isDownPressed() && shooter.posicion.y<height-80) {
        shooter.mover(2, deltaTime);
      }
      if(joyPad.isRightPressed() && shooter.posicion.x<width-130) {
        shooter.mover(3, deltaTime);
      }
      if(joyPad.isBoost()) {
        if(turboVisible) {
          if((millis() - inicioTurbo) * deltaTime < duracionTurbo * deltaTime) {
            shooter.mover(4, deltaTime);
          } else {
            turboVisible = false;
          }
        }
      }
      if((millis() - tiempoAsteroide) * deltaTime >= 120 && cantAsteroides < 6) {
        tiempoAsteroide = millis();
        asteroides[cantAsteroides++] = new Asteroide(new PVector(width, random(30, height-30)), new PVector(250, 0));
      }
    
      if(naveViva) {
        shooter.display();
        for(int i = 0; i < cantAsteroides; i++) {
          Asteroide asteroide = asteroides[i];
          asteroide.display();
          asteroide.mover(0, deltaTime);
      
      // Comprobación de colisión entre la nave y el asteroide       
      
      if(!inmunidadNave && colisionNave(shooter.posicion.x, shooter.posicion.y, 150, 75, asteroide.posicion.x, asteroide.posicion.y, 150, 75)) {
        naveViva = false;
        inmunidadNave = true; // Al colisionar la nave, después de aparecer será inmune por un breve periodo de tiempo
        inicioInmunidad = millis();
        hud.disminuirVida();
        if (hud.cantidadVidas < 1) {
          inicioJuego = false; // Cambiar el estado del juego
          musicaJuego.close();
          finJuego = true;
        }
      }
      
      //Iteración para representar el tiempo de la invulnerabilidad de la nave mediante un escudo
      
      if(inmunidadNave) {
        fill(0, 150, 255, 20);
        noStroke(); 
        ellipse(shooter.posicion.x, shooter.posicion.y, 250, 250); // Círculo externo
        fill(0, 150, 255, 10);
        noStroke();
        ellipse(shooter.posicion.x, shooter.posicion.y, 250, 90); // Círculo interno, este representa a la hitbox de colisión de la nave
      }
      
      // Elimina los asteroides que salieron de la pantalla
      
      if(asteroide.posicion.x < 0 || colisionNave(shooter.posicion.x, shooter.posicion.y, 150, 75, asteroide.posicion.x, asteroide.posicion.y, 150, 75)) {
        for(int j = i; j < cantAsteroides - 1; j++) {
          asteroides[j] = asteroides[j + 1];
        }
      cantAsteroides--;
      i--;
      }
    }
    
    if((millis() - inicioInmunidad) * deltaTime >= duracionInmunidad * deltaTime) {
      inmunidadNave = false; // Al pasar la duración establecida de inmunidad de la nave, se la desactiva
    }
    } else {
      // Restablece de la nave a su posición y estado iniciales
      shooter = new Shooter(new PVector(50, height/2), new PVector(200, 200));
      naveViva = true;
    }
  } else if (finJuego==true) {
    mostrarPantalla(2);
    musicaFinJuego.play();
    hud.asignarVidas(4);
  }   
}

// Método que sirve para cambiar de pantalla

public void mostrarPantalla(int pantalla) { 
  switch(pantalla) {
    case 0:{
      fondoMenu=loadImage("fondoMenu.jpg");
      imageMode(CENTER);
      image(fondoMenu, width/2, height/2);
    break;
    }
    case 1:{
      fondoJuego=loadImage("fondoJuego.jpg");
      imageMode(CENTER);
      image(fondoJuego, width/2, height/2);
    break;
    }
    case 2:{
      fondoReintentar=loadImage("fondoReintentar.jpg");
      imageMode(CENTER);
      image(fondoReintentar, width/2, height/2);
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
}

public void keyReleased() {
  if(keyCode==ENTER) {
    menu = false;
    musicaMenu.close();
    inicioJuego = true;
    finJuego = false;
  }
  
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
  if(key=='z' || key=='Z') {
    joyPad.setBoost(true);
    turboVisible = true;
    inicioTurbo = millis();
  }
}
