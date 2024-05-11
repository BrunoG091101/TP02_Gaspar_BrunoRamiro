private Dado dado;
private Tablero tablero;

public void setup() {
  size(600, 600);
  dado = new Dado(new PVector(width/2, height/2));
  tablero = new Tablero(new PVector(width/2, height/2));
}

public void draw() {
  background(#AF4F00);
  tablero.display();
  tablero.mostrarDado(dado);
  tablero.mostrarTexto();
}

public void keyPressed() {
  if(key=='p' || key=='P') {
    dado.tirarDado();
  }
  if(key=='k' || key=='K') {
    dado.generarLista();
  }
}
