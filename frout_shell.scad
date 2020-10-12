include <common.scad>

module froutShell_cutout() {//从前面板中切除的部分
    //切出屏幕孔洞
    translate([shell_thickness+reserved_space, shell_thickness+reserved_space, 0])
    B173QTN014(cutout=true, screw_height=shell_thickness+0.05, active_area_margin=2, additional_cutout="hypo");
    //切出电路板孔洞
    translate([0,
        shell_thickness+board_size[0],
        board_thickness_max+screen_size[2]])
    rotate([180, 0, 0])
    board(screw_height=shell_thickness+0.05);

    //TODO:切出按键孔洞

    
    screw_cutout();//切出螺丝孔洞
}

module B173QTN014_froutShell() { //正面面板
    //translate([shell_thickness+reserved_space, shell_thickness+reserved_space, 0])B173QTN014();
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

B173QTN014_froutShell();