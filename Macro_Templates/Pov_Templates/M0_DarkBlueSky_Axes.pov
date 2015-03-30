// POV-Ray 3.7 Scene File " ... .pov"
// author:  ...
// date:    ...
//--------------------------------------------------------------------------
#version 3.7;
global_settings{ assumed_gamma 1.0 }
#default{ finish{ ambient 0.1 diffuse 0.9 }}
//--------------------------------------------------------------------------
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
//---------------------------------------------------------------------------------

// sky --------------------------------------------------------------------
sky_sphere{ pigment{ gradient <0,1,0>
                     color_map{ [0   color rgb<0.24,0.34,0.56>*1.0]
                                [0.5 color rgb<0.24,0.34,0.56>*0.3]
                                [0.5 color rgb<0.24,0.34,0.56>*0.3]
                                [1.0 color rgb<0.24,0.34,0.56>*1.0]
                              }
                     rotate< 0,0, 0>
                     scale 2 }
           } // end of sky_sphere

//------------------------------ the Axes --------------------------------

//------------------------------------------------------------------------
#macro Axis_( AxisLen, Dark_Texture,Light_Texture)
 union{
    cylinder { <0,-AxisLen,0>,<0,AxisLen,0>,0.05
               texture{checker texture{Dark_Texture }
                               texture{Light_Texture}
                       translate<0.1,0,0.1>}
             }
    cone{<0,AxisLen,0>,0.2,<0,AxisLen+0.7,0>,0
          texture{Dark_Texture}
         }
     } // end of union
#end // of macro "Axis()"
//------------------------------------------------------------------------
#macro AxisXYZ( AxisLenX, AxisLenY, AxisLenZ, Tex_Dark, Tex_Light)
//--------------------- drawing of 3 Axes --------------------------------
#local Font_Name = "cyrvetic.ttf"
#declare Text_Rotate = < 5,-45,0>; //
union{
#if (AxisLenX != 0)
 object { Axis_(AxisLenX, Tex_Dark, Tex_Light)   rotate< 0,0,-90>}// x-Axis
 text   { ttf Font_Name,  "x",  0.15,  0  texture{Tex_Dark}
          rotate Text_Rotate scale 0.6 translate <AxisLenX+0.15,0.3,-0.05> no_shadow }
#end // of #if
#if (AxisLenY != 0)
 object { Axis_(AxisLenY, Tex_Dark, Tex_Light)   rotate< 0,0,  0>}// y-Axis
 text   { ttf Font_Name,  "y",  0.15,  0  texture{Tex_Dark}
          rotate <Text_Rotate.x,0,0> scale 0.6 translate <-0.55,AxisLenY+0.20,-0.05>
          rotate <0,Text_Rotate.y,0> no_shadow }
#end // of #if
#if (AxisLenZ != 0)
 object { Axis_(AxisLenZ, Tex_Dark, Tex_Light)   rotate<90,0,  0>}// z-Axis
 text   { ttf Font_Name,  "z",  0.15,  0  texture{Tex_Dark}
          rotate Text_Rotate scale 0.95 translate <-0.75,0.2,AxisLenZ+0.10> no_shadow }
#end // of #if
} // end of union
#end// of macro "AxisXYZ( ... )"
//-------------------------------------------------------------------------
//------------------------------------------------------------------------
#declare Texture_A_Dark  = texture {
                               pigment{ color rgb<1,0.45,0>}
                               finish { phong 1}
                           }
#declare Texture_A_Light = texture {
                              pigment{ color rgb<1,1,1>}
                              finish { phong 1}
                           }
object{ AxisXYZ( 4.0, 3.5, 6.0, Texture_A_Dark, Texture_A_Light) scale 4}
//-------------------------------------------------- end of coordinate axes

// Standard finish
//#declare StdFinish = F_MetalA;
//#declare StdFinish = finish { diffuse 0.7 };
//#declare StdFinish = finish { phong 0.5 };
//#declare StdFinish = finish { ambient rgb <0.5,0.5,0.5> };
//#declare StdFinish = finish { crand 0.5 phong 0.9};
#declare StdFinish = finish { ambient 0.01 diffuse 0.9 phong 1.0 phong_size 70 metallic brilliance 1.5} ;

//RaytracingContent

//default light
light_source{<1500,2500,-2500> color rgb<1,1,1>*0.9}                // sun
light_source{ cam_location  color rgb<0.9,0.9,1>*0.1 shadowless}// flash













