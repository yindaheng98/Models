include <tank.scad>

module froutScreen(screen_size, screen_margin_bottom, inner_size, thickness, radius) { //前面板壳
    if (!is_list(screen_size)) {
        screen_size=[screen_size,screen_size];
    }
    difference(){
        //simpleTank(inner_size, thickness, center=true);
        roundedTank(inner_size, thickness, radius, center=true);
        translate([-screen_size[0]/2, screen_margin_bottom-screen_size[1]/2, -0.1]) 
        cube([screen_size[0],screen_size[1],thickness+0.2]);
    }
    
}

froutScreen(
    screen_size=[25.6,14.4],
    screen_margin_bottom=4,
    inner_size=[30,20,5],
    thickness=1,radius=0.5);