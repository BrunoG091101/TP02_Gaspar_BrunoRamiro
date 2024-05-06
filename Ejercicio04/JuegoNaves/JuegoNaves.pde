private PImage fondoEspacio;
private Nave naves;
private SpawnerBalas spawnerBalas;
private Enemy naveEnemiga1;
private Enemy naveEnemiga2;
private Enemy naveEnemiga3;
private int cantAsteroides;
private ArrayList<Asteroid> asteroides;
private int tiempoAsteroide;

public void setup() {
  size(800, 800);
  fondoEspacio = loadImage("fondoEspacio.jpg");
  naves = new Nave();
  spawnerBalas = new SpawnerBalas();
  naves.setPosicionJugador1(new PVector((width/2)/2-30, height/2));
  naves.setVelocidadJugador1(new PVector(50, 50));
  naves.setPosicionJugador2(new PVector(((width/2)/2)*3-115, height/2));
  naves.setVelocidadJugador2(new PVector(30, 30));
  naveEnemiga1 = new Enemy();
  naveEnemiga1.setPosicionNaveE(new PVector(120, 10));
  naveEnemiga1.setVelocidadNaveE(new PVector(20, 0));
  naveEnemiga2 = new Enemy();
  naveEnemiga2.setPosicionNaveE(new PVector(width/2, 130));
  naveEnemiga2.setVelocidadNaveE(new PVector(-20, 0));
  naveEnemiga3 = new Enemy();
  naveEnemiga3.setPosicionNaveE(new PVector(width-120, 250));
  naveEnemiga3.setVelocidadNaveE(new PVector(-20, 0));
  asteroides = new ArrayList<Asteroid>();
  cantAsteroides = 0;
}

public void draw() {
  background(0);
  image(fondoEspacio, 0, 0);
  naves.display();
  naves.mover();
  naves.readCommand();
  naveEnemiga1.display();
  naveEnemiga1.mover();
  naveEnemiga2.display();
  naveEnemiga2.mover();
  naveEnemiga3.display();
  naveEnemiga3.mover();
  
  if(millis() - tiempoAsteroide >= 2000 && cantAsteroides < 3) {
    tiempoAsteroide = millis();
    Asteroid nuevoAsteroide = new Asteroid();
    nuevoAsteroide.setPosicionAsteroide(new PVector(random(0, width-75), 0));
    nuevoAsteroide.setVelocidadAsteroide(new PVector(0, 30));
    asteroides.add(nuevoAsteroide);
    cantAsteroides++;
  }
  
  for(int i=0; i<asteroides.size(); i++) {
    Asteroid asteroide = asteroides.get(i);
    asteroide.display();
    asteroide.mover();
    if(asteroide.posicionAsteroide.y>height+80) {
      asteroides.remove(i);
      cantAsteroides--;
    }
  }
}
