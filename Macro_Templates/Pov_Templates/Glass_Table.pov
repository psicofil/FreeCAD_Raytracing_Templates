// ========================================
// Toy plane
// -----------------------------------------
// Made for Persistence of vision 3.6
//==========================================  
// Copyright 2007 Gilles Tran http://www.oyonale.com
// -----------------------------------------
// This work is licensed under the Creative Commons Attribution License. 
// To view a copy of this license, visit http://creativecommons.org/licenses/by/3.0/ 
// or send a letter to Creative Commons, 559 Nathan Abbott Way, Stanford, California 94305, USA.
// You are free:
// - to copy, distribute, display, and perform the work
// - to make derivative works
// - to make commercial use of the work
// Under the following conditions:
// - Attribution. You must give the original author credit.
// - For any reuse or distribution, you must make clear to others the license terms of this work.
// - Any of these conditions can be waived if you get permission from the copyright holder.
// Your fair use and other rights are in no way affected by the above. 
//========================================== 
// Render with +W800 +H600
// no antialiasing needed if the focal blur is turned on
#version 3.6;
#include "colors.inc"
#include "textures.inc"
#include "functions.inc"
#include "metals.inc"

#declare PlaneOK= 1;
#declare FocalBlurOK=1;
#declare RadOK=1; // no radiosity
#declare AreaOK=1;
global_settings {
    assumed_gamma 1
    max_trace_level 30
    #if (RadOK>0)
        radiosity{
            count 200 
            error_bound 0.5
            recursion_limit 2    // CHANGE
            low_error_factor 1  // leave this
            gray_threshold 0   // leave this
            minimum_reuse 0.015  // leave this
            brightness 1         // leave this
            adc_bailout 0.01/2   // CHANGE - use adc_bailo        
            normal on
        }
    #end
}

camera{
    location  <0,20, -100> // position of camera <X Y Z>
    direction 2*z            // which way are we looking <X Y Z> & zoom
    up        y                // which way is +up <X Y Z>
    right     image_width/image_height*x            // which way is +right <X Y Z> and aspect ratio
    look_at   -x*5 // point center of view at this point <X Y Z>
    #if (FocalBlurOK=1)
            aperture 4           // [0...N] larger is narrower depth of field (blurrier)
            blur_samples 200        // number of rays per pixel for sampling
            focal_point -x*7-z*13    // point that is in focus <X,Y,Z>
            confidence 0.95           // [0...<1] when to move on while sampling (smaller is less accurate)
            variance 1/200            // [0...1] how precise to calculate (smaller is more accurate)
    #end

    rotate y*50

}

sky_sphere { 
    pigment {image_map{jpeg "sky" map_type 1}}
} 

light_source {
    -z*1000
    color rgb <255,230,200>*3/255
    #if (AreaOK=1)
        area_light 5*z,5*y, 5,5 adaptive 1 jitter orient circular
    #end
    rotate x*50
    rotate y*60
}

// -----------------------------------------
// Toy plane
// -----------------------------------------

#declare F_Wood=finish{
    ambient 0 diffuse 1 specular 1 roughness 0.02 
    reflection {0,1 fresnel}
}

#declare P_Wood = pigment{image_map{jpeg "wood" interpolate 2} }
#declare T_Wood =texture{
    pigment {P_Wood} 
    finish { F_Wood }
}

difference{
    box{<-120,-100,-40>,<100,100,25>}
    box{<-119,-99,-50>,<99,99,24>}
    texture{T_Wood translate x*0.5 scale 100}
}

#declare StdFinish = F_MetalA;

//RaytracingContent

//default light
// light_source {
//   cam_location + cam_angle * 100
//   color rgb <10, 10, 10>
// }

#declare M_Glass=material{
    texture{
        pigment{
            rgbt <0.7,1,1,0.95>
        }
        finish{ambient 0 diffuse 0.1 reflection{0.1,1 fresnel} conserve_energy}
        
    }
    interior{ior 1.5}
}
#declare Glass=difference{
    box{<-100,-2,-35>,<100,0,23.99>}
    plane{y,0 inverse rotate -x*45 translate -z*34.5}
    plane{y,0 rotate x*45 translate -z*34.5-y*2}
    material{M_Glass}
}    
object{Glass}
