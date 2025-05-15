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
        map_type 1 // projeção esférica
      }
    }
    finish {
      ambient 0.2
      diffuse 0.8
      specular 0.3
    }
  }
}
