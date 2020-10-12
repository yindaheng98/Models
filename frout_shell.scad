include <board_diff.scad>
include <pane.scad>
include <basic/frout_shell.scad>

shell_thickness=2; //外壳厚度
reserved_space=0.5;//预留空间
screen_size=concat(
    [ for (i = B173QTN014_outline_size) i+shell_thickness*2+reserved_space*2 ],
    [B173QTN014_thickness+shell_thickness+0.2]
); //屏幕整体大小//留点空间免得放不进去

module screw_cutout() {
    //TODO:切出螺丝孔洞
}

module froutShell_cutout() {//从前面板中切除的部分
    //切出屏幕孔洞
    translate([shell_thickness+reserved_space, shell_thickness+reserved_space, 0])
    B173QTN014(cutout=true, screw_height=shell_thickness+0.05, active_area_margin=2, additional_cutout="hypo");
    //切出电路板孔洞
    translate([0,
        shell_thickness+board_size[0],
        board_thickness_max+screen_size[2]])
    rotate([180, 0, 0])
    board_diff(screw_height=shell_thickness+0.05);

    //TODO:切出按键孔洞

    
    screw_cutout();//切出螺丝孔洞
}

module backShell_cutout() {
    //TODO:切出接口孔洞

    //TODO:切出按键孔洞

    
    screw_cutout();//切出螺丝孔洞
}

radius=3;

module B173QTN014_froutShell() { //正面面板
    difference(){
        froutShell(
            shell_thickness=shell_thickness,
            radius=radius,
            screen_size=screen_size,
            board_size=[board_size[1],board_size[0]+2.5,board_thickness_max+shell_thickness],
            back_angle=45);
        froutShell_cutout();
    }
}

module B173QTN014_backShell() {
    //TODO:背面面板
}

B173QTN014_froutShell();