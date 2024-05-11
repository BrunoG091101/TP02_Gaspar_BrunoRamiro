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
private int framesPorSegundo;
private float deltaTime;

public void setup() {
  size(800, 800);
  frameRate(10);
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
  framesPorSegundo = round(frameRate);
  deltaTime = 1.0/framesPorSegundo;
  imageMode(CENTER);
  image(fondoEspacio, width/2, height/2);
  musicaJuegoNaves.play();
  
  if(musicaJuegoNaves.position()>=musicaJuegoNaves.length()) {
    musicaJuegoNaves.rewind();
  }
  
  naves.display();
  naves.readCommand();
  naves.mover(deltaTime);
  naves.dispararBalasJ1(naves.balasJugador1, deltaTime);
  naves.dispararBalasJ2(naves.balasJugador2, deltaTime);
  naveEnemiga1.display();
  naveEnemiga1.mover(deltaTime);
  naveEnemiga2.display();
  naveEnemiga2.mover(deltaTime);
  naveEnemiga3.display();
  naveEnemiga3.mover(deltaTime);
  
  if((millis() - tiempoAsteroide) * deltaTime >= 700 && cantAsteroides < 4) {
    tiempoAsteroide = millis();
    asteroides[cantAsteroides++] = new Asteroid(new PVector(random(30, width-30), 0), new PVector(0, 100));
  }
  
  for(int i=0; i<cantAsteroides; i++) {
    Asteroid asteroide = asteroides[i];
    asteroide.display();
    asteroide.mover(deltaTime);
    if(asteroide.posicion.y>height+80) {
      for(int j=i; j<cantAsteroides-1; j++) {
        asteroides[j] = asteroides [j+1];
      }
      cantAsteroides--;
      i--;
    }
  }
}
