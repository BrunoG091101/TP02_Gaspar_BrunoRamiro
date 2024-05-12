class Asteroide extends GameObject {
  
  public Asteroide() {
  }
  
  public Asteroide(PVector posicion, PVector velocidad) {
    this.posicion=posicion;
    this.velocidad=velocidad;
  }
  
  public void display() {
    imagen = loadImage("asteroide.png");
    imageMode(CENTER);
    image(imagen, posicion.x, posicion.y, 80, 80);
  }
  
  public void mover(int direccion, float deltaTime) {
    switch(direccion) {
      case 0:{
        posicion.x-=velocidad.x*deltaTime;
      break;
      }
    }
  }
}
