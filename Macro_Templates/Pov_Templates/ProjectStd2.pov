// Persistence of Vision Ray Tracer Scene Description File
// for FreeCAD (http://www.freecadweb.org)

#version 3.6;

#include "colors.inc"
#include "metals.inc"
#include "golds.inc"
#include "textures.inc"

// ----------------------------------------

global_settings {
    assumed_gamma 1.0
    ambient_light color rgb <1.0,1.0,1.0>
    max_trace_level 10
}  

// ----------------------------------------


sky_sphere {
  pigment {
    gradient y
    color_map {
      [0.5 rgb <0.0,0.5,1.0>]
      [0.7 rgb <0.0,0.1,0.8>]
    }
  }
}


// ----------------------------------------

plane {
  y, -1
  texture {Chrome_Metal pigment {} finish {ambient 0.05 reflection 0.05 specular 0.00} }
}

// Standard finish
#declare StdFinish = F_MetalA;
//#declare StdFinish = finish { diffuse 0.7 };
//#declare StdFinish = finish { phong 0.5 };
//#declare StdFinish = finish { ambient rgb <0.5,0.5,0.5> };
//#declare StdFinish = finish { crand 0.5 phong 0.9};
//#declare StdFinish = finish { ambient 0.01 diffuse 0.9 phong 1.0 phong_size 70 metallic brilliance 1.5} ;

//RaytracingContent

//default light
light_source {
  cam_location + cam_angle * 100
  color rgb <8, 8, 8>
}
