/* This OpenSCAD file generates a grid of holes intended for 3D print sizing.
 * Along the +Y axis are the smallest holes, ascending in size along +X.
 * This file is dedicated to the public domain without warranty.
 * Do whatever you like.
 */

/* This first block of declarations are in support of Thingiverse's
 * Customizer app. See "specification" here:
 * http://customizer.makerbot.com/docs
 */

// List of nominal hole sizes. Should be in ascending order of size.
holes_mm = [2, 2.5, 3, 3.5, 4, 4.5, 5];

// Max amount to shrink below the nominal hole. Should be negative.
undersize_amount = 0; //[-1:0.01:0]

// Max amount beyond nominal to grow the hole. Should be positive.
oversize_amount = 0.5; //[0:0.01:1]

// Increment size between holes.
size_increment = 0.1; //[0:0.05:1]

// Space between the biggest holes.
biggest_hole_padding = 2; //[0:0.5:10]

// Height of the solid.
solid_height_mm = 3; //[0:0.2:10]

// Border around the holes.
solid_border_mm = 2; //[0:0.5:10]

/* Generates a plate with a grid of holes, corner at 0,0,0.
 *   holes_mm[]			List of nominal sizes. Should be sorted ascending.
 *   under_size_mm	Amount added to nominal sizes to generate smallest sizes.
 *   over_size_mm    	Amount added to nominal sizes to generate largest sizes.
 *   size_step_mm    	Size increment when generating intermediate sizes.
 *   hole_margin_mm  	Padding from hole edge to hole edge, at largest hole.
 *   height_mm 				Thickness of the generated plate.
 *   border_mm       	Padding around the edge of the hole array. For text?
 *
 * Note that OpenSCAD is super slow and this takes a while to render. :(
 */
module hole_plate(holes_mm, under_size_mm, over_size_mm, size_step_mm,
                  hole_margin_mm, height_mm, border_mm) {
    
    // You've provided the nominal hole sizes; this generates the rest.
    count_basic_sizes = len(holes_mm);
    size_offsets = [for(i=[under_size_mm : size_step_mm : over_size_mm]) i];
    count_offsets = len(size_offsets);
    
    // Compute the hole pitch from the largest hole and then solid size.
    hole_pitch = (holes_mm[count_basic_sizes-1] + hole_margin_mm);
    plate_size_y = (hole_pitch * count_basic_sizes) + (2 * border_mm);
    plate_size_x = (count_offsets * hole_pitch) + (2 * border_mm);
    
    // Generates the final solid and moves it to the origin.
    translate([border_mm, border_mm, 0]) difference() {
        
        // Base solid from which we will cut holes.
        translate([-border_mm, -border_mm, 0])
          cube([plate_size_x, plate_size_y, height_mm]);

        // Iterates over base hole sizes and offsets, cutting holes on a grid.
        // TODO(zbrozek): Add some label text.
        for(i = [0 : count_basic_sizes - 1]) {
            for(j = [0 : count_offsets - 1]) {
                
            		// Compute hole parameters.
                x = hole_pitch * j;
                y = hole_pitch * i;
                d = holes_mm[i] + size_offsets[j];

                // Generate a cylinder centered at the computed coordinates.
                translate([x + hole_pitch/2, y + hole_pitch/2, 0])
                  cylinder(height_mm, d=d, $fn=30);
            };
        };
    };
};

// Generate a solid from the provided demo parameters.
hole_plate(holes_mm, undersize_amount, oversize_amount, size_increment,
           biggest_hole_padding, solid_height_mm, solid_border_mm);
