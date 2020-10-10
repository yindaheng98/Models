include <frout_shell.scad>
include <board_diff.scad>
include <back_cutout.scad>

shell_thickness=2; //外壳厚度
screen_size=[382.08+1, 214.92+1]; //显示区域大小//留点空间免得被挡住
pane_thickness=4.35+0.2; //留点空间免得放不进去
pane_size=[398.1, 252.5]; //屏幕实际大小

board_height=5.5; //电路板高度//待测
board_thickness=1; //电路板厚度

frout_inner_size=[
    pane_size[0]+shell_thickness,
    pane_size[1]+shell_thickness,
    pane_thickness+board_height+board_thickness+shell_thickness
    ];//前面板内部尺寸

module froutShell_cutout() {
    //切出斜边
    translate([500,frout_inner_size[1]+shell_thickness+0.1+0.1,frout_inner_size[2]+0.1])
    back_cutout(frout_inner_size[2]-pane_thickness-0.2,pane_size[1]+shell_thickness-board_size[0]+0.1,1000);

    //切出接口孔洞
    translate([pane_thickness, 120+pane_thickness, pane_thickness+board_height])rotate([180, 0, 0])
    board_diff(s_height=board_thickness+shell_thickness+0.05,board=true);

    //切出按键孔洞

    //切出螺丝孔洞
}

difference(){
    froutShell(
        screen_size=[screen_size[0], screen_size[1]], 
        screen_margin_bottom=25,
        inner_size=frout_inner_size,
        thickness=2,radius=0.5,pane_margin=3);
    froutShell_cutout();
}
