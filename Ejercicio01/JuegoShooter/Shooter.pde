class Shooter extends GameObject {
  
  public Shooter() {
  }
  
  public Shooter(PVector posicion, PVector velocidad) {
    this.posicion=posicion;
    this.velocidad=velocidad;
  }
 
  public void display() { 
    imagen=loadImage("nave.png");
    imageMode(CENTER);
    image(imagen, posicion.x, posicion.y, 250, 80);
  }
 
  public void mover(int direccion) {
    switch(direccion) {
      case 0:{
        this.posicion.y-=this.velocidad.y;
        break;
      }
      case 1:{
        this.posicion.x-=this.velocidad.x;
        break;
      }
      case 2:{
        this.posicion.y+=this.velocidad.y;
        break;
      }
      case 3:{
        this.posicion.x+=this.velocidad.x;
        break;
      }
      case 4:{
        imagen=loadImage("naveTurbo.png");
        imageMode(CENTER);
        image(imagen, posicion.x, posicion.y, 250, 80);
        this.posicion.x+=this.velocidad.x+20;
        break;
      }
    }
  }
}
