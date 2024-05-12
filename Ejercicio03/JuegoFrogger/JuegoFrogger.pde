private Jugador jugador;
private SpawnerVehiculos spawnerVehiculos;
private int framesPorSegundo;
private float deltaTime;

void setup() {
  size(800, 800);
  frameRate(10);
  jugador = new Jugador();
  jugador.setPosicion(new PVector(width/2, height-120));
  jugador.setVelocidad(new PVector(140, 140));
  spawnerVehiculos = new SpawnerVehiculos();
}

void draw() {
  background(#10AA03);
  framesPorSegundo = round(frameRate);
  deltaTime = 1.0/framesPorSegundo;
  fill(#5A5A5A);
  rect(0, 400, width, 250);
  line(0, 520, width, 520);
  jugador.display();
  if(jugador.isMoverArriba() && jugador.posicion.y>26) {
    jugador.mover(0, deltaTime);
  }
  if(jugador.isMoverIzquierda() && jugador.posicion.x>26) {
    jugador.mover(1, deltaTime);
  }
  if(jugador.isMoverAbajo() && jugador.posicion.y<height-26) {
    jugador.mover(2, deltaTime);
  }
  if(jugador.isMoverDerecha() && jugador.posicion.x<width-26) {
    jugador.mover(3, deltaTime);
  }
  spawnerVehiculos.mostrarVehiculosC1(spawnerVehiculos.vehiculosCarril1, deltaTime);
  spawnerVehiculos.mostrarVehiculosC2(spawnerVehiculos.vehiculosCarril2, deltaTime);
  spawnerVehiculos.mostrarVehiculosC3(spawnerVehiculos.vehiculosCarril3, deltaTime);
}

public void keyPressed() {  
  if(keyCode==UP) {
    jugador.setMoverArriba(true);
  }
  
  if(keyCode==LEFT) {
    jugador.setMoverIzquierda(true);
  }
  
  if(keyCode==DOWN) {
    jugador.setMoverAbajo(true);
  }
  
  if(keyCode==RIGHT) {
    jugador.setMoverDerecha(true);
  }
}

public void keyReleased() {
  if(keyCode==UP) {
    jugador.setMoverArriba(false);
  }
  
  if(keyCode==LEFT) {
    jugador.setMoverIzquierda(false);
  }
  
  if(keyCode==DOWN) {
    jugador.setMoverAbajo(false);
  }
  
  if(keyCode==RIGHT) {
    jugador.setMoverDerecha(false);
  }
}
