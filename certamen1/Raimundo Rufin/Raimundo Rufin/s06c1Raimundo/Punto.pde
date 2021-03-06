class Punto {
  // variables de posicion y multiplicador para definir sentido inicial del objeto
  float x, y, mult;

  int opa = 0; // variable de opacidad


  // direccion y velocidad incial del punto con numeros aleatorios enteros
  int vx = (int) random(3, 5);
  int vy = (int) random(3, 5);

  //Constructor
  Punto(float px, float py, float pmult) {

    x = px;
    y = py;

    mult = pmult;


    vx *= pmult;
    vy *= pmult;
  }

  /* ejecuta 3 metodos simultaneamente,sirve para no tener
   que ejecutar cada metodo por separado por cada objeto de la clase*/
  void run() {
    create();
    move();
    bounce();
  }

  //Crea un punto no visible
  void create() {
    //strokeWeight(5);
    noStroke();
    //stroke(255,200);
    point(x, y);
  }

  //mueve el punto no visible
  void move() {
    x += vx;
    y += vy;
  }

  //hace que dicho punto rebote con los bordes
  void bounce() {
    if (x > width || x < 0) {
      vx *= -1;
    }
    if (y > height || y < 0) {
      vy *= -1;
    }
  }

  //conecta a 2 objetos de la misma clase con un linea
  void con(Punto m) {
    if (dist(x, y, m.x, m.y) < 350) {
      strokeWeight(2);
      stroke(255, 50);
      line(x, y, m.x, m.y);
    }
  }

  void tri(Punto a, Punto b) {
    //crea un triangulo entre 3 objetos
    fill(255, opa);
    noStroke();
    triangle(x, y, a.x, a.y, b.x, b.y);

    /* cambia la opacidad de dicho triangulo en funcion de la distancia
     entre cada objeto */
    if (dist(x, y, a.x, a.y) <= 350 && dist(a.x, a.y, b.x, b.y) <= 350 && dist(b.x, b.y, x, y) <= 350) {
      opa += 3;
    } else {
      opa -= 10;
    }

    //limita la opacidad entre 0 y 255
    if (opa < 0) {
      opa = 0;
    } else if (opa > 255) {
      opa = 255;
    }
  }
}
