// Persistence of Vision Ray Tracer Scene Description File
// for FreeCAD (http://free-cad.sf.net)

#version 3.6;

#include "colors.inc"
#include "textures.inc"
#include "glass.inc"
#include "metals.inc"
#include "golds.inc"
#include "stones.inc"
#include "woods.inc"
#include "shapes.inc"
#include "shapes2.inc"
#include "functions.inc"
#include "math.inc"
#include "transforms.inc"

// ----------------------------------------

global_settings {
    assumed_gamma 1.0
    ambient_light color rgb <1.0,1.0,1.0>
    max_trace_level 20
}  

// ----------------------------------------


sky_sphere {
  pigment {
    gradient y
    color_map {
      [0.0 rgb <0.6,0.7,1.0>]
      [0.7 rgb <0.0,0.1,0.8>]
    }
  }
}

#declare Floor_Texture =
    texture {T_Wood14
        scale 20
        finish { reflection 0.05 }
    }

plane {
  y, -1
  texture {Floor_Texture finish {ambient 0.6 reflection 0.00 specular 0.00} }
}

// Standard finish
//declare StdFinish = F_Glass1
#declare StdFinish = F_MetalA;
//#declare StdFinish = finish { diffuse 0.7 };
//#declare StdFinish = finish { phong 0.5 };
//#declare StdFinish = finish { ambient rgb <0.5,0.5,0.5> };
//#declare StdFinish = finish { crand 0.5 phong 0.9};
//#declare StdFinish = finish { ambient 0.01 diffuse 0.9 phong 1.0 phong_size 70 metallic brilliance 1.5} ; 

//RaytracingContent

//default light
light_source {
    cam_location
    color White
    area_light <100, 0, 0>, <0, 0, 100>, 10, 10
    adaptive 1
    jitter
} 
