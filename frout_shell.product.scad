include <frout_shell.scad>
include <pane.scad>

//translate([shell_thickness, shell_thickness, 0])B173QTN014(false);
difference(){
    froutShell();
    translate([shell_thickness, shell_thickness, 0])B173QTN014(true, 2.01, 2, "hypo");
}
