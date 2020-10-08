module circular_angle(radius){ //单个圆角
    difference(){
        cube(radius+0.1);
        sphere(r=radius);
    }
}

module cube_circular_angle(size, radius){ //长方体的6个圆角
    if (!is_list(size)) {
        size=[size,size,size];
    }

    translate([size[0]-radius,size[1]-radius,size[2]-radius])
    rotate([0, 0, 0])
    circular_angle(radius=radius);
    translate([radius,size[1]-radius,size[2]-radius])
    rotate([0, 0, 90])
    circular_angle(radius=radius);

    translate([size[0]-radius,size[1]-radius,radius])
    rotate([270, 0, 0])
    circular_angle(radius=radius);
    translate([radius,size[1]-radius,radius])
    rotate([270, 0, 90])
    circular_angle(radius=radius);

    translate([size[0]-radius,radius,size[2]-radius])
    rotate([90, 0, 0])
    circular_angle(radius=radius);
    translate([radius,radius,size[2]-radius])
    rotate([90, 0, 270])
    circular_angle(radius=radius);
    
    translate([size[0]-radius,radius,radius])
    rotate([180, 0, 0])
    circular_angle(radius=radius);
    translate([radius,radius,radius])
    rotate([180, 0, 270])
    circular_angle(radius=radius);
}
