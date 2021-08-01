include <frout_shell.scad>
include <back_shell.scad>

translate([0,0,-30])
B173QTN014_froutShell(show_threads = false);
translate([shell_thickness+reserved_space, shell_thickness+reserved_space, 0])B173QTN014();
translate([0,0,30])
B173QTN014_backShell(show_threads = true);