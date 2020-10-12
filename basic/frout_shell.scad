include <tank.scad>

//构造一个有电路板放置空间的圆角前面板
//shell_thickness:板材厚度
//radius:圆角半径
//screen_size:前面的屏幕尺寸
//board_size:后面的电路板尺寸
//back_angle:连接前面板和电路板空间的斜边角度
module froutShell(shell_thickness, screen_size, board_size, back_angle, radius){
    inner_size=[screen_size[0],screen_size[1],screen_size[2]+board_size[2]];

    module backCutout(thickness, width, angle, cutout_width=100) {
        rotate([270, 90, 90])linear_extrude(cutout_width)
        polygon(points=[[0,0],[thickness,0],[thickness,width-thickness/tan(angle)],[0,width]]);
    }
    difference(){
        roundedTank(inner_size, shell_thickness, radius, sidesonly=true, center=false);
        translate([screen_size[0]+shell_thickness+5, screen_size[1]+shell_thickness+5, inner_size[2]+0.01])
        backCutout(board_size[2], screen_size[1]-board_size[1]+shell_thickness+5, back_angle, screen_size[0]+shell_thickness*2+10);
    }
}