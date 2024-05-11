abstract class GameObject {
  protected PVector posicion;
  protected PVector velocidad;
  protected PImage imagen;
  
  abstract void display();
  abstract void mover(int direccion, float deltaTime);
}
