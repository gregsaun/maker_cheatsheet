module hole_plate(holes, under_size, over_size, size_step, hole_margin, height, border) {
    count_basic_sizes = len(holes);
    size_offsets = [for(i=[under_size : size_step : over_size]) i];
    count_offsets = len(size_offsets);
    
    hole_pitch = (holes[count_basic_sizes-1] + hole_margin);
    plate_size_y = (hole_pitch * count_basic_sizes) + (2 * border);
    plate_size_x = (count_offsets * hole_pitch) + (2 * border);
    
    translate([border, border, 0]) difference() {
        translate([-border, -border, 0]) cube([plate_size_x, plate_size_y, height]);
        for(i = [0 : count_basic_sizes - 1]) {
            for(j = [0 : count_offsets - 1]) {
                x = hole_pitch * j;
                y = hole_pitch * i;
                d = (holes[i]+size_offsets[j]);
                translate([x + hole_pitch/2, y + hole_pitch/2, 0]) cylinder(height, d=d, $fn=30);
            };
        };
    };
};

hole_plate([2, 2.5, 3, 3.5, 4, 5], -0.2, 0.5, 0.1, 2, 3, 2);
