B173QTN014_active_area_size=[382.08,214.92];//显示区域尺寸
B173QTN014_active_area_outline_size=[398.10,230.45];//屏幕主要部分的外圈尺寸
B173QTN014_outline_size=[B173QTN014_active_area_outline_size[0],252.5];//最外圈尺寸
B173QTN014_thickness=4.35;//屏幕厚度
B173QTN014_active_area_outline_margin_bottom=13.4;//面板下方有多少空间

module B173QTN014(cutout=false){
    module main_part(){
        size_bottom=B173QTN014_active_area_outline_margin_bottom;
        translate([0, size_bottom, 0])
        cube(concat(B173QTN014_active_area_outline_size,[B173QTN014_thickness]));
        translate([49.05+0.1, 0, 0])cube([300,size_bottom+0.1,B173QTN014_thickness]);
    }
    module screw_cutouts() {
        module screw_cutout() {
            cylinder(r=1, h=100, center=true);
            translate([8,0,0])cylinder(r=1, h=100, center=true);
        }
        diff=[344.5,239.11];
        loc=[22.815,13.4-(diff[1]-5.505-B173QTN014_active_area_outline_size[1])];
        translate(concat(loc,[0])){
            screw_cutout();
            translate([diff[0], 0, 0])screw_cutout();
            translate([0, diff[1], 0])screw_cutout();
            translate([diff[0], diff[1], 0])screw_cutout();
        }
    }
    module screw_boards() {
        h_top=8.65;//屏幕上方的螺丝板厚度
        h_down=7.5;//屏幕下方的螺丝板厚度
        w_left=49.05-19.315-14.74;//屏幕靠左的螺丝板宽度
        w_right=49.05-19.285-14.77;//屏幕靠右的螺丝板宽度
        loc_down=13.4;//屏幕下方的螺丝板上顶边纵坐标
        loc_top=loc_down+B173QTN014_active_area_outline_size[1];//屏幕上方的螺丝板下顶边纵坐标
        loc_left=19.315;//屏幕左侧的螺丝板左顶边横坐标
        loc_right=49.05+300+14.77;//屏幕右侧的螺丝板左顶边横坐标
        thickness=1;//厚度

        translate([0, 0, thickness]) {
            translate([loc_left, loc_down, 0])rotate([180, 0, 0])cube([w_left,h_down,thickness]);//左下角的螺丝板
            translate([loc_right, loc_down, 0])rotate([180, 0, 0])cube([w_right,h_down,thickness]);//右下角的螺丝板
        }
        translate([loc_left, loc_top, 0])cube([w_left,h_top,thickness]);//左上角的螺丝板
        translate([loc_right, loc_top, 0])cube([w_right,h_top,thickness]);//右上角的螺丝板
    }
    module _B173QTN014(){
        difference(){
            union(){
                main_part();
                screw_boards();
            }
            screw_cutouts();
        }
    }
    module CUTOUT(){
        cube(size=concat(B173QTN014_outline_size,[B173QTN014_thickness]));
        screw_cutouts();
    }
    if(cutout)CUTOUT();
    else _B173QTN014();
}
