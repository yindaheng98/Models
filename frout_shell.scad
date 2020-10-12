include <common.scad>

module B173QTN014_froutShell() { //正面面板
    reserved_space=reserved_space_screen+reserved_space_backshell;//为后面板留点空间
    screen_size=concat(
        [ for (i = B173QTN014_outline_size) i+shell_thickness*2+reserved_space*2 ],
        [B173QTN014_thickness+reserved_driverboard_height+shell_thickness]
    ); //屏幕整体大小//留点空间免得放不进去

    module froutShell_cutout() {//从前面板中切除的部分
        //切出屏幕孔洞
        translate([shell_thickness+reserved_space, shell_thickness+reserved_space, 0])
        B173QTN014(cutout=true, screw_height=shell_thickness+0.05, active_area_margin=2, additional_cutout="hypo");
        //切出电路板孔洞
        driverboard();

        //TODO:切出按键孔洞
        
        screw_cutout();//切出螺丝孔洞
    }

    //translate([shell_thickness+reserved_space, shell_thickness+reserved_space, 0])B173QTN014();
    difference(){
        froutShell(
            shell_thickness=shell_thickness,
            radius=radius,
            screen_size=screen_size,
            board_size=[board_size[1],board_size[0]+2.5,board_thickness_max],
            back_angle=30);
        froutShell_cutout();
    }
}