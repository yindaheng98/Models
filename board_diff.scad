include <tank.scad>
include <NopSCADlib/vitamins/pcb.scad>
include <interfaces/miniDP.scad>

module ports_diff(){
    translate([50, 13, 2])cube([100,8,5],true);
    translate([0, 25.5, 0])usb_uA(true);
    translate([0, 39.5, 0])usb_C(true);
    translate([0, 56.5, 0])hdmi(hdmi_mini,true);
    translate([0, 75.5, 0])hdmi(hdmi_mini,true);
    translate([0, 93.5, -1])dp_mini(true);
    translate([0, 108, -1])jack(true);
}

module screw_diff(){
    module S(){
        translate([0,0,-3.5])
        rotate([180,0,0])screw(M2_cs_cap_screw, 5);
    }
    translate([3, 3, 0])S();
    translate([3, 120-3, 0])S();
    translate([75-3, 3, 0])S();
    translate([75-3, 120-3, 0])S();
}

module board_diff() {
    scale([0.5, 1, 1])translate([-50,0,-0.01])ports_diff();
    translate([0,0,-0.01])screw_diff();
}

color("silver")translate([0, 0, -1])cube([75, 120, 1]);
board_diff();