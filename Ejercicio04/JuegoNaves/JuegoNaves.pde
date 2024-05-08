import ddf.minim.*;

Minim minim;
AudioPlayer musicaJuegoNaves;
private PImage fondoEspacio;
private Nave naves;
private Enemy naveEnemiga1;
private Enemy naveEnemiga2;
private Enemy naveEnemiga3;
private Asteroid[] asteroides;
private int cantAsteroides;
private int tiempoAsteroide;

public void setup() {
  size(800, 800);
  minim = new Minim(this);
  musicaJuegoNaves = minim.loadFile("musicaJuegoNaves.mp3");
  fondoEspacio = loadImage("fondoEspacio.jpg");
  naves = new Nave();
  naves.setPosicionJugador1(new PVector((width/2)/2-30, height/2));
  naves.setVelocidadJugador1(new PVector(50, 50));
  naves.setPosicionJugador2(new PVector(((width/2)/2)*3-115, height/2));
  naves.setVelocidadJugador2(new PVector(30, 30));
  naveEnemiga1 = new Enemy(new PVector(120, 10), new PVector(20, 0));
  naveEnemiga2 = new Enemy(new PVector(width/2, 130), new PVector(-20, 0));
  naveEnemiga3 = new Enemy(new PVector(width-120, 250), new PVector(-20, 0));
  asteroides = new Asteroid[3];
  cantAsteroides = 0;
}

public void draw() {
  background(0);
  image(fondoEspacio, 0, 0);
  musicaJuegoNaves.play();
  
  if(musicaJuegoNaves.position()>=musicaJuegoNaves.length()) {
    musicaJuegoNaves.rewind();
  }
  
  naves.display();
  naves.mover();
  naves.readCommand();
  naves.dispararBalasJ1(naves.balasJugador1);
  naves.dispararBalasJ2(naves.balasJugador2);
  naveEnemiga1.display();
  naveEnemiga1.mover();
  naveEnemiga2.display();
  naveEnemiga2.mover();
  naveEnemiga3.display();
  naveEnemiga3.mover();
  
  if(millis() - tiempoAsteroide >= 2000 && cantAsteroides < 3) {
    tiempoAsteroide = millis();
    asteroides[cantAsteroides++] = new Asteroid(new PVector(random(0, width-75), 0), new PVector(0, 30));
  }
  
  for(int i=0; i<cantAsteroides; i++) {
    Asteroid asteroide = asteroides[i];
    asteroide.display();
    asteroide.mover();
    if(asteroide.posicion.y>height+80) {
      for(int j=i; j<cantAsteroides-1; j++) {
        asteroides[j] = asteroides [j+1];
      }
      cantAsteroides--;
      i--;
    }
  }
}
