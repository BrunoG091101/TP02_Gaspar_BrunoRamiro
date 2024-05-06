class SpawnerBalas {
  private Bala[] balas;
  
  public SpawnerBalas() {
    balas = new Bala[1];
  }
  
  public void generarBalas(Nave nave) {
    balas[0] = new Bala(nave.getPosicionJugador1());
  }
}
