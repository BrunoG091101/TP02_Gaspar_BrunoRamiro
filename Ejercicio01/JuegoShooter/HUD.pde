class HUD {
  private Shooter shooter;
  private int cantidadVidas;
  private PVector posicionTexto;
  
  public HUD(Shooter shooter) {
    this.shooter=shooter;
    this.posicionTexto = new PVector(55, 35);
  }
  
  public void asignarVidas(int cantidadVidas) {
    shooter.setCantidadVidas(cantidadVidas);
  }
  
  public void mostrarVidas() {
    this.cantidadVidas = shooter.getCantidadVidas();
    fill(#FFD900);
    textSize(25);
    textAlign(LEFT, TOP);
    text("x"+cantidadVidas, posicionTexto.x, posicionTexto.y);
  }
  
  public void disminuirVida() {
    shooter.setCantidadVidas(shooter.getCantidadVidas() - 1);
  }
}
