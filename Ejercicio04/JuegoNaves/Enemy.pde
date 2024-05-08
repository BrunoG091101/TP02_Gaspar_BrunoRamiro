class Enemy extends GameObject implements IDisplayable, IMoveable {
  
  public Enemy() {
  }
  
  public Enemy(PVector posicion, PVector velocidad) {
    this.posicion=posicion;
    this.velocidad=velocidad;
  }
  
  public void display() {
    imagen=loadImage("naveEnemiga.png");
    image(imagen, posicion.x, posicion.y, 100, 100);
  }
  
  public void mover() {
    posicion.x-=velocidad.x;
    if(posicion.x>=width-110) {
      velocidad.x*=-1;
    } else if(posicion.x<=10) {
      velocidad.x*=-1;
    }
  }
}
