include <tank.scad>
include <NopSCADlib/vitamins/pcb.scad>
include <interfaces/miniDP.scad>

board_size=[120,75];//驱动板尺寸

module ports_diff(){//接口孔洞
    translate([50, 13, 2])cube([100,8,5],true);
    translate([0, 25.5, 0])usb_uA(true);
    translate([0, 39.5, 0])usb_C(true);
    translate([0, 56.5, 0])hdmi(hdmi_mini,true);
    translate([0, 75.5, 0])hdmi(hdmi_mini,true);
    translate([0, 93.5, -1])dp_mini(true);
    translate([0, 108, -1])jack(true);
}

module screw_diff(s_height=3){//螺丝孔洞
    module S(){
        translate([0,0,-s_height])
        rotate([180,0,0])screw(M2_cs_cap_screw, 5);
    }
    translate([3, 3, 0])S();
    translate([3, board_size[0]-3, 0])S();
    translate([board_size[1]-3, 3, 0])S();
    translate([board_size[1]-3, 120-3, 0])S();
}

module board_diff(s_height=3,board=false) {//组合为电路板孔洞
    scale([0.5, 1, 1])translate([-50,0,-0.01])ports_diff();
    translate([0,0,-0.01])screw_diff(s_height);
    if (board)color("silver")translate([0, 0, -1])cube([board_size[1], board_size[0], 1]);
}
