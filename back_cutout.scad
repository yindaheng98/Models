module back_cutout(height, width, cutout_length=100) {
    rotate([270, 90, 90])linear_extrude(cutout_length)
    polygon(points=[[0,0],[height,0],[height,width-height],[0,width]]);
}