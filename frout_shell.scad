include <tank.scad>

module froutBasicShell(screen_size, screen_margin_bottom, inner_size, thickness, radius) { //前面板基础外壳
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
        screen_loc=[(inner_size[0]-screen_size[0])/2, screen_margin_bottom, -thickness-0.1];
        translate(screen_loc)cube([screen_size[0],screen_size[1],thickness+0.2]);
    }
}

module froutPane(screen_size, margin, thickness){
    if (!is_list(screen_size)) {
        screen_size=[screen_size,screen_size];
    }
    translate([0, 0, -thickness])
    cube([screen_size[0], screen_size[1], thickness/2+0.1]);
    translate([-margin, -margin, -thickness/2])
    cube([screen_size[0]+margin*2, screen_size[1]+margin*2, thickness/2]);
}

module froutShell(screen_size,screen_margin_bottom,inner_size,thickness,radius,pane_margin){
    if (!is_list(screen_size)) {
        screen_size=[screen_size,screen_size];
    }
    if (!is_list(inner_size)) {
        inner_size=[inner_size,inner_size,inner_size];
    }
    difference(){
        froutBasicShell(screen_size, screen_margin_bottom, inner_size, thickness, radius);
        translate([(inner_size[0]-screen_size[0])/2-pane_margin, screen_margin_bottom-pane_margin, -thickness/2])
        cube([screen_size[0]+pane_margin*2, screen_size[1]+pane_margin*2, thickness/2+0.1]);
    }
}

module froutShellWithPane(screen_size,screen_margin_bottom,inner_size,thickness,radius,pane_margin,pane_loc){
    if (!is_list(screen_size)) {
        screen_size=[screen_size,screen_size];
    }
    if (!is_list(inner_size)) {
        inner_size=[inner_size,inner_size,inner_size];
    }
    froutShell(screen_size,screen_margin_bottom,inner_size,thickness,radius,pane_margin);
    screen_loc=[(inner_size[0]-screen_size[0])/2, screen_margin_bottom, 0];
    translate(screen_loc)translate(pane_loc)froutPane(screen_size, pane_margin, thickness);
}

module froutShellWithPaneForShow(screen_size,screen_margin_bottom,inner_size,thickness,radius,pane_margin,pane_loc_z){
    if (!is_list(screen_size)) {
        screen_size=[screen_size,screen_size];
    }
    if (!is_list(inner_size)) {
        inner_size=[inner_size,inner_size,inner_size];
    }
    froutShell(screen_size,screen_margin_bottom,inner_size,thickness,radius,pane_margin);
    screen_loc=[(inner_size[0]-screen_size[0])/2, screen_margin_bottom, 0];
    pane_loc=[0,0,pane_loc_z];
    translate(screen_loc)translate(pane_loc)froutPane(screen_size, pane_margin, thickness);
}
module froutShellWithPaneForPrint(screen_size,screen_margin_bottom,inner_size,thickness,radius,pane_margin,pane_loc_y){
    if (!is_list(screen_size)) {
        screen_size=[screen_size,screen_size];
    }
    if (!is_list(inner_size)) {
        inner_size=[inner_size,inner_size,inner_size];
    }
    translate([0,0,thickness])
    froutShell(screen_size,screen_margin_bottom,inner_size,thickness,radius,pane_margin);
    screen_loc=[(inner_size[0]-screen_size[0])/2, screen_margin_bottom, 0];
    pane_loc=[0,pane_loc_y,0];
    rotate([180, 0, 0]) 
    translate(screen_loc)translate(pane_loc)froutPane(screen_size, pane_margin, thickness);
}
