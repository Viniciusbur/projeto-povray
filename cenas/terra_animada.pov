#version 3.7;

camera {
  location <0, 2, -5>
  look_at  <0, 1, 0>
}

light_source {
  <2, 4, -3>
  color rgb <1, 1, 1>
}

sphere {
  <0, 1, 0>, 1
  texture {
    pigment {
      image_map {
        jpeg "earth.jpg"
        map_type 1
        interpolate 2
      }
    }
    finish {
      ambient 0.2
      diffuse 0.8
      specular 0.3
    }
  }
  rotate <0, 360*clock, 0> // rotação no eixo Y
}
