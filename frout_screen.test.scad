include <frout_screen.scad>
translate([0, 15, 0])
froutShellWithPaneForShow(
    screen_size=[25.6,14.4],
    screen_margin_bottom=2,
    inner_size=[30,20,5],
    thickness=1,radius=0.5,pane_margin=1,
    pane_loc_z=10);

translate([0, -15, 0])
froutShellWithPaneForPrint(
    screen_size=[25.6,14.4],
    screen_margin_bottom=2,
    inner_size=[30,20,5],
    thickness=1,radius=0.5,pane_margin=1,
    pane_loc_y=5);