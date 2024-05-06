class Asteroid implements IDisplayable, IMoveable {
  private PImage asteroide;
  private PVector posicionAsteroide;
  private PVector velocidadAsteroide;
  
  public Asteroid() {
  }
  
  public Asteroid(PVector posicionAsteroide, PVector velocidadAsteroide) {
    this.posicionAsteroide=posicionAsteroide;
    this.velocidadAsteroide=velocidadAsteroide;
  }
  
  public PVector getPosicionAsteroide() {
    return this.posicionAsteroide;
  }
  
  public void setPosicionAsteroide(PVector posicionAsteroide) {
    this.posicionAsteroide=posicionAsteroide;
  }
  
  public PVector getVelocidadAsteroide() {
    return this.getVelocidadAsteroide();
  }
  
  public void setVelocidadAsteroide(PVector velocidadAsteroide) {
    this.velocidadAsteroide=velocidadAsteroide;
  }
  
  public void display() {
    asteroide = loadImage("asteroide.png");
    image(asteroide, posicionAsteroide.x, posicionAsteroide.y, 80, 80);
  }
  
  public void mover() {
    posicionAsteroide.y+=velocidadAsteroide.y;
  }
}
