#version 3.7;
global_settings { assumed_gamma 1.0 }

// Dimensões do render (pode ser sobrescrito pelo +W +H no terminal)
#declare Image_Width = 1920;
#declare Image_Height = 800;

camera {
  location <0, 200, -2000> // mais alto e longe para capturar os dois
  look_at  <0, 0, 0>
  angle 30
}

light_source {
  <0, 1000, -2000>
  color rgb <1, 1, 1>
}

background { color rgb <0, 0, 0> }

// Escalas reais aproximadas
#declare RaioSol = 696.0;
#declare RaioTerra = 6.4;

// Sol
sphere {
  <0, 0, 0>, RaioSol
  texture {
    pigment {
      image_map {
        jpeg "modelos/sun.jpg"
        map_type 1
        interpolate 2
      }
    }
    finish {
      ambient 1
      diffuse 0
      emission rgb <1, 0.6, 0.1>
    }
  }
}

// Terra (com distância proporcionalmente reduzida para caber)
sphere {
  <1300, 0, 0>, Ra
