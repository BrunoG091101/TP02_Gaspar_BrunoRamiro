class Vehiculo extends GameObject {
  
  public Vehiculo() {
  }
  
  public Vehiculo(PVector posicion, PVector velocidad) {
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
}
