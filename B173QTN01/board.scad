include <NopSCADlib/vitamins/pcb.scad>
include <../interfaces/miniDP.scad>

board_thickness_max=5.5;
board_thickness=1;
board_size=[120,75];//驱动板尺寸

module board_ports(){//接口孔洞
    translate([50, 13, 5/2-1])cube([100,8,5],true);
    translate([0, 25.5, 0])usb_uA(true);
    translate([0, 39.5, 0])usb_C(true);
    translate([0, 56.5, 0])hdmi(hdmi_mini,true);
    translate([0, 75.5, 0])hdmi(hdmi_mini,true);
    translate([0, 93.5, -board_thickness])dp_mini(true);
    translate([0, 108, -board_thickness])jack(true);
}

module board_screws(screw_height=2){//螺丝孔洞
    module S(){
        translate([0,0,-screw_height-board_thickness])
        rotate([180,0,0]){
            screw(M2_cs_cap_screw, 5);
            translate([0, 0, -1])cylinder(r=1, h=2, center=true);
        }
    }
    translate([3, 3, 0])S();
    translate([3, board_size[0]-3, 0])S();
    translate([board_size[1]-3, 3, 0])S();
    translate([board_size[1]-3, 120-3, 0])S();
}

module board(screw_height=2, cutout=false) {//组合为电路板孔洞
    translate([0, 0, board_thickness]) {
        if(cutout){
            color("silver")translate([-board_size[1], -0.2, -board_thickness])
            cube([board_size[1] * 2, board_size[0]+0.4, board_thickness_max+1]);
        }else {
            translate([0, 0, 0.3]) {
                scale([0.5, 1, 1])rotate([0,0,180])translate([-50,-board_size[0],-0.01])board_ports();
                color("silver")translate([0, 0, -board_thickness])
                cube([board_size[1], board_size[0], board_thickness]);
            }
        }
        translate([0,0,-0.01])board_screws(screw_height);
    }
}
