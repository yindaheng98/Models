B173QTN014_active_area_size=[382.08,214.92];//显示区域尺寸
B173QTN014_active_area_outline_size=[398.10,230.45];//屏幕主要部分的外圈尺寸
B173QTN014_outline_size=[B173QTN014_active_area_outline_size[0],252.5];//最外圈尺寸
B173QTN014_thickness=4.35;//屏幕厚度
B173QTN014_active_area_outline_margin_bottom=13.4;//面板下方有多少空间
B173QTN014_active_area_margin_bottom=B173QTN014_active_area_outline_size[1]-6.6-B173QTN014_active_area_size[1]+13.4;//显示区域下方有多少空间

module B173QTN014(cutout=false, active_area_margin=0, additional_cutout="none", additional_cutout_margin=0, additional_cutout_thickness=0){
    module main_part(){//屏幕主体
        size_bottom=B173QTN014_active_area_outline_margin_bottom;
        translate([0, size_bottom, 0])
        cube(concat(B173QTN014_active_area_outline_size,[B173QTN014_thickness]));
        translate([49.05+0.1, 0, 0])cube([300,size_bottom+0.1,B173QTN014_thickness]);
    }
    module active_area(margin=0,thickness=1, additional_cutout="none"){//屏幕活动区域
        origin_size=B173QTN014_active_area_size;
        origin_loc=[8.01,B173QTN014_active_area_outline_margin_bottom+B173QTN014_active_area_outline_size[1]-6.6-B173QTN014_active_area_size[1]];
        size=[origin_size[0]+margin*2,origin_size[1]+margin*2];
        loc=[origin_loc[0]-margin,origin_loc[1]-margin];
        color("white")translate(concat(loc,[0]))cube(concat(size,[thickness]));

        module step_cutout(margin, thickness){
            translate(concat([for (i=loc)i-margin],[-thickness]))
            cube(concat([for(i=size)i+margin*2],[thickness+0.1]));
        }

        module hypo_cutout(){
            hull(){
                translate(concat([for(i=loc)i+0.1],[0]))cube(size=concat([for(i=size)i-0.2],[0.1]));
                translate(concat([for (i=loc)i-50],[-50]))cube(size=concat([for(i=size)i+100],[1]));
            }
        }
        if(additional_cutout == "step"){
            translate([0, 0, 50])color("white")
            step_cutout(additional_cutout_margin, additional_cutout_thickness);
        } else if(additional_cutout == "hypo"){
            translate([0, 0, 50])color("white")
            hypo_cutout();
        }
    }
    module screw_cutouts(h=100) {//屏幕4个角上的螺丝固定孔
        module screw_cutout(h=100) {
            cylinder(r=1, h=h, center=true);
            translate([8,0,0])cylinder(r=1, h=100, center=true);
        }
        diff=[344.5,239.11];
        loc=[22.815,B173QTN014_active_area_outline_margin_bottom-(diff[1]-5.505-B173QTN014_active_area_outline_size[1])];
        translate(concat(loc,[0])){
            screw_cutout(h);
            translate([diff[0], 0, 0])screw_cutout(h);
            translate([0, diff[1], 0])screw_cutout(h);
            translate([diff[0], diff[1], 0])screw_cutout(h);
        }
    }
    module screw_boards() {//屏幕4个角上的螺丝固定孔板
        h_top=8.65;//屏幕上方的螺丝板厚度
        h_down=7.5;//屏幕下方的螺丝板厚度
        w_left=49.05-19.315-14.74;//屏幕靠左的螺丝板宽度
        w_right=49.05-19.285-14.77;//屏幕靠右的螺丝板宽度
        loc_down=B173QTN014_active_area_outline_margin_bottom;//屏幕下方的螺丝板上顶边纵坐标
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


    module _B173QTN014(){//生成屏幕
        difference(){
            union(){
                main_part();
                screw_boards();
                translate([0,0,-0.01])active_area();
            }
            screw_cutouts();
        }
    }
    module CUTOUT(active_area_margin, additional_cutout){//生成差分用模型
        cube(size=concat(B173QTN014_outline_size,[B173QTN014_thickness]));
        screw_cutouts();
        translate([0,0,-50])
        active_area(margin=active_area_margin,thickness=100,additional_cutout=additional_cutout);
    }
    if(cutout)CUTOUT(active_area_margin, additional_cutout);
    else _B173QTN014();
}
