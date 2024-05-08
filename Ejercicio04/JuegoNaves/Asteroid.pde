class Asteroid extends GameObject implements IDisplayable, IMoveable {
  
  public Asteroid() {
  }
  
  public Asteroid(PVector posicion, PVector velocidad) {
    this.posicion=posicion;
    this.velocidad=velocidad;
  }
  
  public void display() {
    imagen = loadImage("asteroide.png");
    image(imagen, posicion.x, posicion.y, 80, 80);
  }
  
  public void mover() {
    posicion.y+=velocidad.y;
  }
}
