Nave naves;
Enemy naveEnemiga1;
Enemy naveEnemiga2;
Enemy naveEnemiga3;

public void setup() {
  size(800, 800);
  naves = new Nave();
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
}

public void draw() {
  background(0);
  naves.display();
  naves.mover();
  naves.readCommand();
  naveEnemiga1.display();
  naveEnemiga1.mover();
  naveEnemiga2.display();
  naveEnemiga2.mover();
  naveEnemiga3.display();
  naveEnemiga3.mover();
}
