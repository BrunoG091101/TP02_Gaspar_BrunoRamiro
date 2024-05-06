class Enemy implements IDisplayable, IMoveable {
  private PImage naveEnemiga;
  private PVector posicionNaveE;
  private PVector velocidadNaveE;
  
  public Enemy() {
  }
  
  public PVector getPosicionNaveE() {
    return this.posicionNaveE;
  }
  
  public void setPosicionNaveE(PVector posicionNaveE) {
    this.posicionNaveE=posicionNaveE;
  }
  
  public PVector getVelocidadNaveE() {
    return this.velocidadNaveE;
  }
  
  public void setVelocidadNaveE(PVector velocidadNaveE) {
    this.velocidadNaveE=velocidadNaveE;
  }
  
  public void display() {
    naveEnemiga=loadImage("naveEnemiga.png");
    image(naveEnemiga, posicionNaveE.x, posicionNaveE.y, 100, 100);
  }
  
  public void mover() {
    posicionNaveE.x-=velocidadNaveE.x;
    if(posicionNaveE.x>=width-110) {
      velocidadNaveE.x*=-1;
    } else if(posicionNaveE.x<=10) {
      velocidadNaveE.x*=-1;
    }
  }
}
