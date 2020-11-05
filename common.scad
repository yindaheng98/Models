include <B173QTN01/board.scad>
include <B173QTN01/pane.scad>
include <B173QTN01/keyboard.scad>
include <basic/frout_shell.scad>
include <basic/back_shell.scad>
include <NopSCADlib/core.scad>

shell_thickness=2; //外壳厚度
radius=3;//圆角半径
reserved_space_screen=0.5;//为屏幕预留的空间
reserved_space_backshell=0.1;//为后面板预留的空间
reserved_space=reserved_space_screen+reserved_space_backshell;//为后面板留点空间
reserved_driverboard_height=0.2;
screen_size=concat(
    [ for (i = B173QTN014_outline_size) i+shell_thickness*2+(reserved_space_screen+reserved_space_backshell)*2 ],
    [B173QTN014_thickness+shell_thickness+0.2]
); //屏幕整体大小//留点空间免得放不进去

module screw_cutout() {
    module Screws() {
        module Screw() {
            rotate([0, 270, 0]){
                let($show_threads = true)
                screw(type = M3_cs_cap_screw, length = 7);
                translate([0, 0, -1])cylinder(r=1.5, h=2, center=true);
                //translate([0,0,-shell_thickness*2])mirror([0,0,1])nut(M3_nut);
            }
        }
        translate([9+shell_thickness, -2.1, 3+2])rotate([0,0,90])Screw();//最底下的螺孔

        screw_from_border=shell_thickness+2;
        screw_loc_h=screen_size[2]+1;
        translate([0, screen_size[1]-screw_from_border, (screen_size[2]+shell_thickness)/2-shell_thickness])Screw();//最顶上的螺孔
        translate([0, board_size[0]+shell_thickness+6, screw_loc_h])Screw();//中间的螺孔
    }
    translate([-shell_thickness-0.05, 0, 0])Screws();
    translate([screen_size[0]+shell_thickness+0.1,0,0])mirror([1,0,0])Screws();
}

module driverboard(cutout = false) {
    module _driverboard() {
        //切出电路板孔洞
        loc_z = board_thickness_max+B173QTN014_thickness+reserved_driverboard_height+0.01;
        loc_y = shell_thickness+3.2;
        screw_height = shell_thickness+0.05;
        translate([0, board_size[0]+loc_y, loc_z])rotate([180, 0, 0])
        board(screw_height = screw_height, cutout = cutout);

        translate([screen_size[0]-keyboard_size[1]-key_length,loc_y,loc_z])
        rotate([180, 0, 90])keyboard(screw_height = screw_height, cutout = cutout);
    }
    #translate([0,0,-0.02])_driverboard();
}