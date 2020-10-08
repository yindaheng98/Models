include <tank.scad>

module froutScreen(screen_size, screen_margin_bottom, inner_size, thickness, radius) { //前面板壳
    if (!is_list(screen_size)) {
        screen_size=[screen_size,screen_size];
    }
    if (!is_list(inner_size)) {
        inner_size=[inner_size,inner_size,inner_size];
    }
    difference(){
        //simpleTank(inner_size, thickness, center=true);
        roundedTank(inner_size, thickness, radius,sidesonly=true, center=false);
        border_bottom=-screen_size[1]/2;
        screen_loc=[(inner_size[0]-screen_size[0])/2, screen_margin_bottom ,-thickness-0.1];
        translate(screen_loc)cube([screen_size[0],screen_size[1],thickness+0.2]);
    }
}

froutScreen(
    screen_size=[25.6,14.4],
    screen_margin_bottom=2,
    inner_size=[30,20,5],
    thickness=1,radius=0.5);