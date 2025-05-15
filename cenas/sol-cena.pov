#version 3.7;

global_settings { assumed_gamma 1.0 }

camera {
  location <0, 5, -15>
  look_at  <0, 0, 0>
}

light_source {
  <0, 100, -100>
  color rgb <1, 1, 1>
}

background { color rgb <0, 0, 0> }

sphere {
  <0, 0, 0>, 5
  texture {
    pigment {
      image_map {
        jpeg "sun/sun.jpg"
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
