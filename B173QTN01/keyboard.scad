include <NopSCADlib/vitamins/pcb.scad>
keyboard_size = [70, 15, 1];
key_height = 4;
keyboard_thickness_max = keyboard_size[2] + key_height + 0.1;
key_length = 1.2;

module keys() { //按键加LED排布
    module key() {
        translate([0, -1, 0])cube(size=[4,2,key_height], center=true);
        translate([0, 4.9, 1])rotate([90, 0, 0]){
            cylinder(r=1.5, h=10, center=true);
            translate([0, 0, 4 - key_length])
            cylinder(r=4, h=1);
        }
    }
    module led() {
        translate([0, -1, 0])cube(size=[4,2,key_height], center=true);
        translate([0, 4, 1])rotate([90, 0, 0])
        cylinder(r=1, h=10, center=true);
    }
    key_spacing = 10;//按键间距一厘米
    key_loc_begin = [8.5, 19.5];//最开始的两个间距比较特殊
    key_loc = concat(key_loc_begin, [for (i = [1:3]) key_loc_begin[1]+i*key_spacing]);
    led_loc = key_loc_begin[1] + 3*key_spacing + 8;//LED距离最后一个按键距离为8mm
    for (loc=key_loc)translate([loc,0,0])key();
    translate([led_loc,0,0])led();
}

module keyboard(screw_height = 0, cutout = false) { //按键板
    module screws() {
        module S(){
                rotate([0,180,0])screw(M2_cs_cap_screw, 50);
                cylinder(r=1, h=10, center=true);
            }
        loc_x = [2,keyboard_size[0]-2];
        loc_y = 2;
        translate([loc_x[0],loc_y,0])S();
        translate([loc_x[1],loc_y,0])S();
    }

    module _keyboard(cutout = false) { //调整位置前的按键板
        if (cutout) {
            translate([0, 0, keyboard_size[2]-keyboard_thickness_max])
            cube(size=[keyboard_size[0], keyboard_size[1]+10, keyboard_thickness_max]);
        }else{
            translate([0, 15, -2])keys();
            color("silver")cube(size=keyboard_size);
        }
    }
    translate([keyboard_size[0], 0, 0])
    rotate([0,180,0])
    translate([0, 0, -keyboard_size[2]])
    _keyboard(cutout);
    translate([0,0,-screw_height])screws();
}