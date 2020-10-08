include <angle.scad>
include <edge.scad>

module cube_round(size, radius){ //长方体的圆角和圆边
    cube_circular_angle(size=size, radius=radius);
    cube_circular_edge(size=size, radius=radius);
}

module rounded_cube(size, radius){ //圆角圆边长方体
    difference(){
        cube(size=size);
        cube_circular_angle(size=size, radius=radius);
        cube_circular_edge(size=size, radius=radius);
    }
}