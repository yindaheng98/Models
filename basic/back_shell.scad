module backShell(shell_thickness, screen_size, board_size, back_angle) {
    module back_mod(bottom_size, top_size, angle) {
        cube(bottom_size);
        translate([0,0,bottom_size[2]-0.1])cube([bottom_size[0],top_size[1],top_size[2]+0.1]);
        module ladder(top_l,height,angle) { //梯形
            bottom_l=top_l+height/tan(angle);
            top_left=[0,height];
            bottom_right=[bottom_l,0];
            top_right=[top_l,height];
            polygon(points=[[0,0],top_left,top_right,bottom_right]);
        }
        rotate([90, 0, 90])linear_extrude(height=bottom_size[0])
        ladder(top_size[1],bottom_size[2]+top_size[2],angle);
    }
    difference() {
        translate([-shell_thickness, -shell_thickness, 0])back_mod(
            [screen_size[0]+shell_thickness*2,screen_size[1]+shell_thickness*2,screen_size[2]+shell_thickness],
            [board_size[0]+shell_thickness*2,board_size[1]+shell_thickness*2,board_size[2]],
            back_angle);
        translate([0, 0, -0.1])back_mod(
            [screen_size[0],screen_size[1],screen_size[2]+0.1],
            board_size, back_angle);
    }
}
