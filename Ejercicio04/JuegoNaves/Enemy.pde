class Enemy extends GameObject implements IDisplayable, IMoveable {
  private int millisIniciales;
  
  public Enemy() {
    millisIniciales = millis();
  }
  
  public Enemy(PVector posicion, PVector velocidad) {
    this.posicion=posicion;
    this.velocidad=velocidad;
  }
  
  public void display() {
    imagen=loadImage("naveEnemiga.png");
    imageMode(CENTER);
    image(imagen, posicion.x, posicion.y, 100, 100);
  }
  
  public void mover() {
    int millisActuales = millis();
    float deltaTime = (millisIniciales - millisActuales) / 1000.0;
    posicion.x-=velocidad.x*deltaTime;
    if(posicion.x>width-80) {
      velocidad.x*=-1;
    } else if(posicion.x<80) {
      velocidad.x*=-1;
    }
    millisIniciales = millisActuales;
  }
}
