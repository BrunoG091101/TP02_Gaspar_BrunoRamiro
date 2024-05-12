class SpawnerVehiculos {
  private Vehiculo[] vehiculosCarril1;
  private int indiceVehiculosC1;
  private int tiempoTranscurridoC1;
  private int tiempoAparicionC1;
  private Vehiculo[] vehiculosCarril2;
  private int indiceVehiculosC2;
  private int tiempoTranscurridoC2;
  private int tiempoAparicionC2;
  private Vehiculo[] vehiculosCarril3;
  private int indiceVehiculosC3;
  private int tiempoTranscurridoC3;
  private int tiempoAparicionC3;
  
  public SpawnerVehiculos() {
    vehiculosCarril1 = new Vehiculo[5];
    indiceVehiculosC1 = 0;
    tiempoTranscurridoC1 = 0;
    tiempoAparicionC1 = 500;
    vehiculosCarril2 = new Vehiculo[3];
    indiceVehiculosC2 = 0;
    tiempoTranscurridoC2 = 0;
    tiempoAparicionC2 = 1200;
    vehiculosCarril3 = new Vehiculo[2];
    indiceVehiculosC3 = 0;
    tiempoAparicionC3 = 800;
  }
  
  public void mostrarVehiculosC1(Vehiculo[] vehiculosCarril1, float deltaTime) {
  tiempoTranscurridoC1 += deltaTime * 1600;
  if (tiempoTranscurridoC1 >= tiempoAparicionC1 && indiceVehiculosC1 < vehiculosCarril1.length) {
    tiempoTranscurridoC1 = 0;
    if (indiceVehiculosC1 == 0) {
      vehiculosCarril1[indiceVehiculosC1] = new Vehiculo();
      vehiculosCarril1[indiceVehiculosC1].setPosicion(new PVector(width, 440));
      vehiculosCarril1[indiceVehiculosC1].setVelocidad(new PVector(350*deltaTime, 0));
      indiceVehiculosC1++;
    } else {
      vehiculosCarril1[indiceVehiculosC1] = new Vehiculo();
      vehiculosCarril1[indiceVehiculosC1].setPosicion(new PVector(width, 440));
      vehiculosCarril1[indiceVehiculosC1].setVelocidad(new PVector(350*deltaTime, 0));
      indiceVehiculosC1++;
    }
  }
  for (int i = 0; i < indiceVehiculosC1; i++) {
    Vehiculo listaC1 = vehiculosCarril1[i];
    fill(#033BFF);
    rect(listaC1.posicion.x, listaC1.posicion.y, 60, 20);
    listaC1.posicion.x -= listaC1.velocidad.x;
    if (listaC1.posicion.x < 0) {
      for (int j = i; j < indiceVehiculosC1 - 1; j++) {
        vehiculosCarril1[j] = vehiculosCarril1[j + 1];
      }
      indiceVehiculosC1--;
      i--;
      }
    }
  }
  
  public void mostrarVehiculosC2(Vehiculo[] vehiculosCarril2, float deltaTime) {
  tiempoTranscurridoC2 += deltaTime*1200;
  if (tiempoTranscurridoC2 >= tiempoAparicionC2 && indiceVehiculosC2 < vehiculosCarril2.length) {
    tiempoTranscurridoC2 = 0;
    if (indiceVehiculosC2 == 0) {
      vehiculosCarril2[indiceVehiculosC2] = new Vehiculo();
      vehiculosCarril2[indiceVehiculosC2].setPosicion(new PVector(0, 505));
      vehiculosCarril2[indiceVehiculosC2].setVelocidad(new PVector(280*deltaTime, 0));
      indiceVehiculosC2++;
    } else {
      vehiculosCarril2[indiceVehiculosC2] = new Vehiculo();
      vehiculosCarril2[indiceVehiculosC2].setPosicion(new PVector(0, 505));
      vehiculosCarril2[indiceVehiculosC2].setVelocidad(new PVector(280*deltaTime, 0));
      indiceVehiculosC2++;
    }
  }
  for (int i = 0; i < indiceVehiculosC2; i++) {
    Vehiculo listaC2 = vehiculosCarril2[i];
    fill(#FFC903);
    rect(listaC2.posicion.x, listaC2.posicion.y, 90, 28);
    listaC2.posicion.x += listaC2.velocidad.x;
    if (listaC2.posicion.x > width) {
      for (int j = i; j < indiceVehiculosC2 - 1; j++) {
        vehiculosCarril2[j] = vehiculosCarril2[j + 1];
      }
      indiceVehiculosC2--;
      i--;
      }
    }
  }
  
  public void mostrarVehiculosC3(Vehiculo[] vehiculosCarril3, float deltaTime) {
  tiempoTranscurridoC3 += deltaTime*400;
    if(tiempoTranscurridoC3>=tiempoAparicionC3 && indiceVehiculosC3<vehiculosCarril3.length) {  
      tiempoTranscurridoC3=0;
      if (indiceVehiculosC3 == 0) {
        vehiculosCarril3[indiceVehiculosC3] = new Vehiculo();
        vehiculosCarril3[indiceVehiculosC3].setPosicion(new PVector(width, 580));
        vehiculosCarril3[indiceVehiculosC3].setVelocidad(new PVector(200*deltaTime, 0));
        indiceVehiculosC3++;
      } else {
        vehiculosCarril3[indiceVehiculosC3] = new Vehiculo();
        vehiculosCarril3[indiceVehiculosC3].setPosicion(new PVector(width, 580));
        vehiculosCarril3[indiceVehiculosC3].setVelocidad(new PVector(200*deltaTime, 0));
        indiceVehiculosC3++;
      }
    }
    for(int i=0; i<indiceVehiculosC3; i++) {
      Vehiculo listaC3=vehiculosCarril3[i];
      fill(#EA0000);
      rect(listaC3.posicion.x, listaC3.posicion.y, 150, 40);
      listaC3.posicion.x-=listaC3.velocidad.x;
      if(listaC3.posicion.x<0) {
        for(int j=i; j<indiceVehiculosC3-1; j++) {
          vehiculosCarril3[j] = vehiculosCarril3[j+1];
        }
      indiceVehiculosC3--;
      i--;
      }
    }
  }
}
