include <B173QTN013/board.scad>
include <B173QTN013/pane.scad>
include <basic/frout_shell.scad>

shell_thickness=2; //外壳厚度
radius=3;//圆角半径
reserved_space=0.5;//预留空间
screen_size=concat(
    [ for (i = B173QTN014_outline_size) i+shell_thickness*2+reserved_space*2 ],
    [B173QTN014_thickness+shell_thickness+0.2]
); //屏幕整体大小//留点空间免得放不进去

module screw_cutout() {
    //TODO:切出螺丝孔洞
}