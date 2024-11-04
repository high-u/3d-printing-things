segments = 128;

isDev = false;

if (isDev) {
    for (i = [0:5]) {
        rotate([0, 0, i * 60])
        translate([10, 0, 0])
        sphere(r=3, $fn=32);
    }
}

module frame() {
    difference() {
        cylinder(h=10, r=15, center=true, $fn=segments);
        cylinder(h=12, r=12, center=true, $fn=segments);
    }

    difference() {
        cylinder(h=10, r=8, center=true, $fn=segments);
        cylinder(h=12, r=5, center=true, $fn=segments);
    }
}

difference() {
    frame();

    rotate_extrude(angle=360, convexity=10, $fn=segments) {
        translate([10, 0, 0])
        circle(r=(3 + 0.1), $fn=segments);
    }

    if (isDev) {
        translate([0, -10, 0])
        cube([40, 20, 20], center=true);
    }
}


difference() {
    cylinder(h=10, r=11.4, center=true, $fn=segments);
    cylinder(h=12, r=8.6, center=true, $fn=segments);
    for (i = [0:5]) {
        rotate([0, 0, i * 60])
        translate([10, 0, 0])
        sphere(r=(3 + 0.2), $fn=segments);
    }
    //for (i = [0:5]) {
    //    rotate([0, 0, i * 60])
    //    translate([10, 0, 4])
    //    cube([5, 5, 8], center=true);
    //}
    for (i = [0:5]) {
        rotate([0, 0, i * 60])
        translate([10, 0, 3.6])
        cylinder(h=8, r=2.6, center=true, $fn=segments);
    }
    
    //for (i = [0:5]) {
    //    rotate([0, 0, i * 60])
    //    translate([10, 0, 6])
    //    rotate([45, 0, 0])
    //    cube([8, 8, 8], center=true);
    //}
    for (i = [0:5]) {
        rotate([0, 0, i * 60 + 30])
        translate([10, 0, 2.2])
        cube([5, 1, 10], center=true);
    }
    translate([0, 0, 9.6])
    cube([40, 40, 10], center=true);
    translate([0, 0, -9.6])
    cube([40, 40, 10], center=true);
    
    //for (i = [0:5]) {
    //    rotate([0, 0, i * 60])
    //    translate([12, 0, 5])
    //    rotate([45, 45, 0])
    //    cube([7, 7, 7], center=true);
    //}
}



