camera {
  location <0, 800, -2400>
  look_at <0, 0, 0>
}

light_source {
  <0, 1500, -2500>
  color rgb <1, 1, 1>
}

background { color rgb <0, 0, 0> }

// --- Sol rotacionando
sphere {
  <0, 0, 0>, 60
  texture {
    pigment {
      image_map {
        jpeg "../texturas/sun.jpg"
        map_type 1
      }
      rotate <0, clock * 360, 0> // rotação visual do Sol
    }
    finish { ambient 1 diffuse 0 }
  }
}

// --- Macros ---
#macro PlanetaOrbitando(raio, tamanho, textura, periodoAnos, rotacaoTipo)
  #local velocidadeOrbital = (1 / periodoAnos) * 4; // 4x mais rápido
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

// --- Órbitas expandidas
OrbitaTracejada(120, 40)   // Mercúrio
OrbitaTracejada(200, 50)   // Vênus
OrbitaTracejada(300, 60)   // Terra
OrbitaTracejada(400, 70)   // Marte
OrbitaTracejada(600, 80)   // Júpiter
OrbitaTracejada(800, 90)   // Saturno
OrbitaTracejada(1000, 100) // Urano
OrbitaTracejada(1200, 110) // Netuno

// --- Planetas com velocidades proporcionais e rotações personalizadas
PlanetaOrbitando(120, 10, "../texturas/mercury.jpg", 0.24, "")
PlanetaOrbitando(200, 13, "../texturas/venus.jpg", 0.62, "retrograda")
PlanetaOrbitando(300, 14, "../texturas/earth.jpg", 1.0, "")
PlanetaOrbitando(400, 12, "../texturas/mars.jpg", 1.88, "")
PlanetaOrbitando(600, 20, "../texturas/jupiter.jpg", 11.86, "")
PlanetaOrbitando(800, 18, "../texturas/saturn.jpg", 29.46, "")
PlanetaOrbitando(1000, 15, "../texturas/uranus.jpg", 84.01, "inclinado")
PlanetaOrbitando(1200, 15, "../texturas/neptune.jpg", 164.79, "")
