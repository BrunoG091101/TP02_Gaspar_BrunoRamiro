class Jugador extends GameObject {
  private boolean moverArriba;
  private boolean moverIzquierda;
  private boolean moverAbajo;
  private boolean moverDerecha;
  
  public Jugador() {
  }
  
  public Jugador(PVector posicion, PVector velocidad) {
    this.posicion=posicion;
    this.velocidad=velocidad;
  }
  
  public PVector getPosicion() {
    return this.posicion;
  }
  
  public void setPosicion(PVector posicion) {
    this.posicion=posicion;
  }
  
  public PVector getVelocidad() {
    return this.velocidad;
  }
  
  public void setVelocidad(PVector velocidad) {
    this.velocidad=velocidad;
  }
  
  public boolean isMoverArriba() {
    return moverArriba;
  }
  
  public void setMoverArriba(boolean moverArriba) {
   this.moverArriba=moverArriba;
  }
  
  public boolean isMoverIzquierda() {
    return moverIzquierda;
  }
  
  public void setMoverIzquierda(boolean moverIzquierda) {
   this.moverIzquierda=moverIzquierda;
  }
  
  public boolean isMoverAbajo() {
    return moverAbajo;
  }
  
  public void setMoverAbajo(boolean moverAbajo) {
   this.moverAbajo=moverAbajo;
  }
  
  public boolean isMoverDerecha() {
    return moverDerecha;
  }
  
  public void setMoverDerecha(boolean moverDerecha) {
   this.moverDerecha=moverDerecha;
  }
  
  public void display() {
    fill(#863201);
    ellipse(posicion.x, posicion.y, 30, 30);
  }
  
  public void mover(int direccion, float deltaTime) {
    switch(direccion) {
      case 0:{
        posicion.y-=velocidad.y*deltaTime;
      break;
      }
      case 1:{
        posicion.x-=velocidad.x*deltaTime;
      break;
      }
      case 2:{
        posicion.y+=velocidad.y*deltaTime;
      break;
      }
      case 3:{
        posicion.x+=velocidad.x*deltaTime;
      break;
      }
    }
  }
}
