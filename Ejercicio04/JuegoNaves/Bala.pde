class Bala implements IDisplayable, IMoveable, IController{
  private PImage balaJugador1;
  private PVector posicionBalaJ1;
  private PVector velocidadBalaJ1;
  private PImage balaJugador2;
  private PVector posicionBalaJ2;
  private PVector velocidadBalaJ2;
  
  public Bala() {
  }
  
  public Bala(PVector posicionBañaJ1, PVector posicionBalaJ2) {
  }
  
  public PVector getPosicionBalaJ1() {
    return this.posicionBalaJ1;
  }
  
  /*public void setPosicionBalaJ1(PVector posicionBalaJ1) {
    this.posicionBalaJ1=posicionBalaJ1;
  }*/
  
  public PVector getVelocidadBalaJ1() {
    return this.velocidadBalaJ1;
  }
  
  /*public void setVelocidadbalaJ1(PVector velocidadBalaJ1) {
    this.velocidadBalaJ1=velocidadBalaJ1;
  }*/
  
  public PVector getPosicionBalaJ2() {
    return this.posicionBalaJ2;
  }
  
  /*public void setPosicionBalaJ2(PVector posicionBalaJ2) {
    this.posicionBalaJ2=posicionBalaJ2;
  }*/
  
  public PVector getVelocidadBalaJ2() {
    return this.velocidadBalaJ2;
  }
  
  /*public void setVelocidadbalaJ2(PVector velocidadBalaJ2) {
    this.velocidadBalaJ2=velocidadBalaJ2;
  }*/
  
  public void display() {
    balaJugador1=loadImage("bala1.png");
    balaJugador2=loadImage("bala2.png");
  }
}
