class Shooter extends GameObject {
  private int cantidadVidas;
  
  public Shooter() {
  }
  
  public Shooter(PVector posicion, PVector velocidad) {
    this.posicion=posicion;
    this.velocidad=velocidad;
  }
  
  public int getCantidadVidas() {
    return cantidadVidas;
  }
  
  public void setCantidadVidas(int cantidadVidas) {
    this.cantidadVidas=cantidadVidas;
  }
 
  public void display() { 
    imagen=loadImage("nave.png");
    imageMode(CENTER);
    image(imagen, posicion.x, posicion.y, 250, 80);
  }
 
  public void mover(int direccion, float deltaTime) {
    switch(direccion) {
      case 0:{
        this.posicion.y-=this.velocidad.y*deltaTime;
      break;
      }
      case 1:{
        this.posicion.x-=this.velocidad.x*deltaTime;
      break;
      }
      case 2:{
        this.posicion.y+=this.velocidad.y*deltaTime;
      break;
      }
      case 3:{
        this.posicion.x+=this.velocidad.x*deltaTime;
      break;
      }
      case 4:{
        imagen=loadImage("naveTurbo.png");
        imageMode(CENTER);
        image(imagen, posicion.x, posicion.y, 250, 80);
        this.posicion.x+=(this.velocidad.x+450)*deltaTime;
      break;
      }
    }
    //posicion.add(PVector.mult(velocidad, deltaTime));
  }
}
