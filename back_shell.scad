include <common.scad>


module B173QTN014_backShell() {
    reserved_space=reserved_space_screen;
    screen_size=concat(
        [ for (i = B173QTN014_outline_size) i+reserved_space*2 ],
        [B173QTN014_thickness+0.2]
    ); //屏幕整体大小//留点空间免得放不进去

    module backShell_cutout() {
        //TODO:切出接口孔洞

        //TODO:切出按键孔洞

        screw_cutout();//切出螺丝孔洞
        driverboard();//切出电路板螺丝孔洞
    }

    difference() {
        translate([shell_thickness+reserved_space_backshell, shell_thickness+reserved_space_backshell, 0])
        backShell(
            shell_thickness=shell_thickness,
            screen_size=screen_size,
            board_size=[board_size[1],board_size[0]+2.5,board_thickness_max],
            back_angle=30);
        backShell_cutout();
    }

}
