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
  naves.setVelocidadJugador1(new PVector(125, 125));
  naves.setPosicionJugador2(new PVector(((width/2)/2)*3-115, height/2));
  naves.setVelocidadJugador2(new PVector(100, 100));
  naveEnemiga1 = new Enemy(new PVector(width/4, 60), new PVector(100, 0));
  naveEnemiga2 = new Enemy(new PVector(width/2, 180), new PVector(-100, 0));
  naveEnemiga3 = new Enemy(new PVector(width/4*3, 300), new PVector(-100, 0));
  asteroides = new Asteroid[4];
  cantAsteroides = 0;
}

public void draw() {
  background(0);
  imageMode(CENTER);
  image(fondoEspacio, width/2, height/2);
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
  
  if(millis() - tiempoAsteroide >= 2000 && cantAsteroides < 4) {
    tiempoAsteroide = millis();
    asteroides[cantAsteroides++] = new Asteroid(new PVector(random(30, width-30), 0), new PVector(0, 20));
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
