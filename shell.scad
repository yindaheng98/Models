include <frout_shell.scad>
include <back_shell.scad>

B173QTN014_froutShell();
translate([shell_thickness+reserved_space_backshell, shell_thickness+reserved_space_backshell, 0])
B173QTN014_backShell();