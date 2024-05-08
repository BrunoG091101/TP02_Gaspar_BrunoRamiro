private Dado dado;
private String numero;

public void setup() {
  size(600, 600);
  dado = new Dado(new PVector(width/2, height/2));
}

public void draw() {
  background(#04B92F);
  dado.display();
  if (dado.numeroDado==1) {
    numero = "UNO";
    fill(0);
    textSize(40);
    textAlign(RIGHT, TOP);
    text(numero, width-20, 20);
  } else if (dado.numeroDado==2) {
    numero = "DOS";
    fill(0);
    textSize(40);
    textAlign(RIGHT, TOP);
    text(numero, width-20, 20);
  } else if (dado.numeroDado==3) {
    numero = "TRES";
    fill(0);
    textSize(40);
    textAlign(RIGHT, TOP);
    text(numero, width-20, 20);
  } else if (dado.numeroDado==4) {
    numero = "CUATRO";
    fill(0);
    textSize(40);
    textAlign(RIGHT, TOP);
    text(numero, width-20, 20);
  } else if (dado.numeroDado==5) {
    numero = "CINCO";
    fill(0);
    textSize(40);
    textAlign(RIGHT, TOP);
    text(numero, width-20, 20);
  } else if (dado.numeroDado==6) {
    numero = "SEIS";
    fill(0);
    textSize(40);
    textAlign(RIGHT, TOP);
    text(numero, width-20, 20);
  }
}

public void keyPressed() {
  if(key=='p' || key=='P') {
    dado.tirarDado();
  }
  if(key=='k' || key=='K') {
    dado.generarLista();
  }
}
