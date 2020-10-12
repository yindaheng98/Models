include <B173QTN013/board.scad>
include <B173QTN013/pane.scad>
include <basic/frout_shell.scad>
include <NopSCADlib/core.scad>

shell_thickness=2; //外壳厚度
radius=3;//圆角半径
reserved_space=0.5;//预留空间
screen_size=concat(
    [ for (i = B173QTN014_outline_size) i+shell_thickness*2+reserved_space*2 ],
    [B173QTN014_thickness+shell_thickness+0.2]
); //屏幕整体大小//留点空间免得放不进去

module screw_cutout() {
    //TODO:切出螺丝孔洞
    module Screws() {
        module Screw() {
            rotate([0, 270, 0]){
                let($show_threads = true)
                screw(type = M3_cs_cap_screw, length = 7, hob_point = 1, nylon = true);
                translate([0, 0, 7-shell_thickness-0.1])
                screw(type = M3_grub_screw, length = 7, hob_point = 1, nylon = true);
                //translate([0,0,-shell_thickness*2])mirror([0,0,1])nut(M3_nut);
            }
        }
        screw_from_border=3;
        translate([0, screen_size[1]-screw_from_border, (screen_size[2]+shell_thickness)/2-shell_thickness])Screw();//最顶上的螺孔

        screw_loc_h=screen_size[2]+1;
        translate([0, screw_from_border, screw_loc_h])Screw();//最底下的螺孔
        translate([0, screen_size[1]/2-board_thickness_max-0.5, screw_loc_h])Screw();//中间的螺孔
    }
    translate([-shell_thickness-0.05, 0, 0])Screws();
    translate([screen_size[0]+shell_thickness+0.1,0,0])mirror([1,0,0])Screws();
}

module keyboard() {

}