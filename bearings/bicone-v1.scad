isDev = false;
fragments = 128;
clearance = 0.1;


module ball() {
    rotate_extrude(angle = 360, convexity = 10, $fn=fragments) {
        polygon([
            [0,              8],
            [3 - clearance,  8],
            [3 - clearance,  6],
            [8 - clearance,  1],
            [8 - clearance, -1],
            [3 - clearance, -6],
            [3 - clearance, -8],
            [0,             -8],
        ]);
        //polygon([
        //    [0,              8],
        //    [3 - clearance,  8],
        //    [3 - clearance,  6 - clearance],
        //    [8 - clearance,  1 - clearance],
        //    [8 - clearance, -1 + clearance],
        //    [3 - clearance, -6 + clearance],
        //    [3 - clearance, -8],
        //    [0,             -8],
        //]);
    }
}

module ballSpace() {
    rotate_extrude(angle = 360, convexity = 10, $fn=fragments) {
        polygon([
            [0,                    9],
            [3 + (clearance * 4),  9],
            [3 + (clearance * 4),  6 + (clearance * 4)],
            [8 + (clearance * 4),  1 + (clearance * 4)],
            [8 + (clearance * 4), -1 - (clearance * 4)],
            [3 + (clearance * 4), -6 - (clearance * 4)],
            [3 + (clearance * 4), -9],
            [0,                   -9],
        ]);
    }
}

module ballRingSpace() {
    rotate_extrude(angle = 360, convexity = 10, $fn=fragments) {
        translate([b, 0, 0])
        polygon([
            [ 6 + clearance,  9],
            [ 6 + clearance,  3],
            [ 8 + clearance,  1],
            [ 8 + clearance, -1],
            [ 6 + clearance, -3],
            [ 6 + clearance, -9],
            [-6 - clearance, -9],
            [-6 - clearance, -3],
            [-8 - clearance, -1],
            [-8 - clearance,  1],
            [-6 - clearance,  3],
            [-6 - clearance,  9],
        ], path=[0,1,2,3,4,5,6,7,8,9,10,11]);
        //polygon([
        //    [ 6 + clearance,  9],
        //    [ 6 + clearance,  3 + clearance],
        //    [ 8 + clearance,  1 + clearance],
        //    [ 8 + clearance, -1 - clearance],
        //    [ 6 + clearance, -3 - clearance],
        //    [ 6 + clearance, -9],
        //    [-6 - clearance, -9],
        //    [-6 - clearance, -3 - clearance],
        //    [-8 - clearance, -1 - clearance],
        //    [-8 - clearance,  1 + clearance],
        //    [-6 - clearance,  3 + clearance],
        //    [-6 - clearance,  9],
        //], path=[0,1,2,3,4,5,6,7,8,9,10,11]);
    }
}

b = 20.0;
module bearing() {
    for (i = [0:5]) {
        rotate([0, 0, i * 60])
        translate([b,0,0])
        ball();
    }
    difference() {
        cylinder(h=16, r=30, center=true, $fn=fragments);
        ballRingSpace();
        
        cylinder(h=18, r=10, center=true, $fn=fragments);
        
        
    }
    difference() {
        difference() {
            cylinder(h=16, r=(b + 4.2 + clearance), center=true, $fn=fragments);
            cylinder(h=18, r=(b - 4.2 - clearance), center=true, $fn=fragments);
        }
        
        for (i = [0:5]) {
            rotate([0, 0, i * 60])
            translate([b, 0, 0])
            ballSpace();
        }
    }
}


if (isDev) {
    difference() {
        bearing();
        translate([0, 40, 10])
        cube([80, 80, 20], center=true);
        translate([40, 40, 0])
        cube([80, 80, 20], center=true);
    }
} else {
    bearing();
}
