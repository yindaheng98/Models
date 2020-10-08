module circular_edge(length, radius){ //单个圆边
    difference(){
        translate([0,0,-0.1])
        cube([radius+0.1,radius+0.1,length+0.2]);
        translate([0,0,-0.2])
        cylinder(h=length+0.4, r=radius);
    }
}

module circular_edge_dim(size, radius){ //在一个维度上的四个圆边
    if (!is_list(size)) {
        size=[size,size,size];
    }
    translate([size[0]-radius,size[1]-radius,radius])
    rotate([0, 0, 0])
    circular_edge(length=size[2]-radius*2, radius=radius);
    translate([radius,size[1]-radius,radius])
    rotate([0, 0, 90])
    circular_edge(length=size[2]-radius*2, radius=radius);
    translate([radius,radius,radius])
    rotate([0, 0, 180])
    circular_edge(length=size[2]-radius*2, radius=radius);
    translate([size[0]-radius,radius,radius])
    rotate([0, 0, 270])
    circular_edge(length=size[2]-radius*2, radius=radius);
}

module cube_circular_edge(size, radius){ //长方体的12个圆边
    if (!is_list(size)) {
        size=[size,size,size];
    }
    rotate([0, 0, 0])
    circular_edge_dim(size=[size[0],size[1],size[2]],radius=radius);
    rotate([90, 0, 0])translate([0,0,-size[1]])
    circular_edge_dim(size=[size[0],size[2],size[1]],radius=radius);
    rotate([0, 90, 0])translate([-size[2],0,0])
    circular_edge_dim(size=[size[2],size[1],size[0]],radius=radius);
}