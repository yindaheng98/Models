include <MCAD/boxes.scad>

//内部尺寸、厚度
module simpleTank(inner_size, thickness, center=false){ //简单直角水槽
    if (!is_list(inner_size)) {
        inner_size=[inner_size,inner_size,inner_size];
    }
    module _tank(){
        difference(){
            cube([inner_size[0]+thickness*2, inner_size[1]+thickness*2, inner_size[2]+thickness]);
            translate([thickness, thickness, thickness+0.01])
            cube([inner_size[0], inner_size[1], inner_size[2]+0.01]);
        }
    }
    if (center) translate([-inner_size[0]/2-thickness, -inner_size[1]/2-thickness, -thickness])_tank();
    else translate([-thickness, -thickness, -thickness])_tank();
}

//内部尺寸、厚度、圆角半径
module roundedTank(inner_size, thickness, radius, sidesonly=false, center=false){ //圆角圆边水槽
    if (!is_list(inner_size)) {
        inner_size=[inner_size,inner_size,inner_size];
    }
    module _tank(){
        difference(){
            translate([inner_size[0]/2+thickness, inner_size[1]/2+thickness, (inner_size[2]+thickness)/2])
            roundedBox(
                size=[inner_size[0]+thickness*2, inner_size[1]+thickness*2, inner_size[2]+thickness],
                radius=radius, sidesonly=sidesonly);
            translate([thickness, thickness, thickness+0.01])
            cube([inner_size[0], inner_size[1], inner_size[2]+0.01]);
        }
    }
    if (center) translate([-inner_size[0]/2-thickness, -inner_size[1]/2-thickness, 0])_tank();
    else translate([-thickness, -thickness, -thickness])_tank();
}
