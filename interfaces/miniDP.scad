include <NopSCADlib/vitamins/pcb.scad>

module dp_mini(cutout = false) { //! Draw mini DisplayPort
    l = 6;
    iw1 = 7.5;
    iw2 = 5.6;
    ih2 = 4.6;
    ih1 = ih2-(iw1-iw2)/2;
    t = 0.4;
    h = ih2+t*2;

    module D() {
        hull() {
            translate([-iw1 / 2, h - t - ih1])
                square([iw1, ih1]);

            translate([-iw2 / 2, h - t - ih2])
                square([iw2, ih2]);
        }
    }

    if(cutout)
        rotate([90, 0, 90])
            linear_extrude(100)
                offset(t + panel_clearance)
                    D();
    else
        color("silver")
            rotate([90, 0, 90]) {
                linear_extrude(l, center = true)
                    difference() {
                        offset(t)
                            D();
                        D();
                    }

                translate_z(-l / 2)
                    linear_extrude(1)
                        offset(t)
                            D();
            }
}