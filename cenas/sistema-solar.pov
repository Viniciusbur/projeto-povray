camera {
  location <0, 400, -1000>
  look_at <0, 0, 0>
}

light_source {
  <0, 1000, -1500>
  color rgb <1, 1, 1>
}

background { color rgb <0, 0, 0> }

// --- Sol ---
sphere {
  <0, 0, 0>, 20
  texture {
    pigment {
      image_map {
        jpeg "sun.jpg"
        map_type 1
      }
    }
    finish { ambient 1 diffuse 0 }
  }
}

// --- Macro com rotação e órbita ---
#macro PlanetaOrbitando(raio, tamanho, textura, periodoAnos, rotacaoTipo)
  #local velocidadeOrbital = 1 / periodoAnos;
  #local anguloOrbital = clock * 360 * velocidadeOrbital;
  #local pos = <cos(radians(anguloOrbital)) * raio, 0, sin(radians(anguloOrbital)) * raio>;

  #local rotacao = clock * 360;

  sphere {
    pos, tamanho
    texture {
      pigment {
        image_map {
          jpeg textura
          map_type 1
        }
        #if (rotacaoTipo = "retrograda")
          rotate <0, -rotacao, 0>
        #elseif (rotacaoTipo = "inclinado")
          rotate <98, rotacao, 0>
        #else
          rotate <0, rotacao, 0>
        #end
      }
      finish { ambient 0.5 diffuse 0.5 }
    }
  }
#end

// --- Macro para órbitas tracejadas proporcionais ---
#macro OrbitaTracejada(raio, segmentos)
  #local i = 0;
  #while (i < segmentos)
    #local ang1 = (i / segmentos) * 360;
    #local ang2 = ((i + 0.5) / segmentos) * 360;

    cylinder {
      <cos(radians(ang1)) * raio, 0, sin(radians(ang1)) * raio>,
      <cos(radians(ang2)) * raio, 0, sin(radians(ang2)) * raio>,
      0.5
      texture {
        pigment { color rgb <0.3, 0.3, 0.3> }
        finish { ambient 0.3 diffuse 0.2 }
      }
    }

    #local i = i + 1;
  #end
#end

// --- Órbitas (raio, segmentos proporcionais) ---
OrbitaTracejada(25, 20)    // Mercúrio
OrbitaTracejada(50, 30)    // Vênus
OrbitaTracejada(80, 40)    // Terra
OrbitaTracejada(120, 50)   // Marte
OrbitaTracejada(180, 60)   // Júpiter
OrbitaTracejada(250, 70)   // Saturno
OrbitaTracejada(330, 80)   // Urano
OrbitaTracejada(420, 90)   // Netuno

// --- Planetas orbitando e girando ---
PlanetaOrbitando(25, 5, "mercury.jpg", 0.24, "")
PlanetaOrbitando(50, 6.5, "venus.jpg", 0.62, "retrograda")
PlanetaOrbitando(80, 7, "earth.jpg", 1.0, "")
PlanetaOrbitando(120, 6, "mars.jpg", 1.88, "")
PlanetaOrbitando(180, 12, "jupiter.jpg", 11.86, "")
PlanetaOrbitando(250, 11, "saturn.jpg", 29.46, "")
PlanetaOrbitando(330, 9, "uranus.jpg", 84.01, "inclinado")
PlanetaOrbitando(420, 9, "neptune.jpg", 164.79, "")
