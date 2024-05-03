private Dado dado;

public void setup() {
  size(600, 600);
  dado = new Dado(new PVector(width/2, height/2));
}

public void draw() {
  background(#04B92F);
  dado.display();
}

public void keyPressed() {
  if(key=='p' || key=='P') {
    dado.tirarDado();
  }
  if(key=='k' || key=='K') {
    dado.generarLista();
  }
}
