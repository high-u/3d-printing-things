fragments = 64;

module corner() {
    translate([0, 0, 6.5])
    cylinder(h=13, r=3, center=true, $fn=fragments);
}
module body() {
    module innerCorner() {
        translate([0, 0, 7.5])
        cylinder(h=15, r=2, center=true, $fn=fragments);
    }
    difference() {
        hull() {
            translate([26 - 0.1, 21 - 0.1, 0])
            corner();
            translate([26 - 0.1, -21 + 0.1, 0])
            corner();
            translate([-26 + 0.1, -21 + 0.1, 0])
            corner();
            translate([-26 + 0.1, 21 - 0.1, 0])
            corner();
        }
        hull() {
            translate([24 + 0.1, 19 + 0.1, 2])
            innerCorner();
            translate([24 + 0.1, -19 - 0.1, 2])
            innerCorner();
            translate([-24 - 0.1, -19 - 0.1, 2])
            innerCorner();
            translate([-24 - 0.1, 19 + 0.1, 2])
            innerCorner();
        }
        translate([-9.4, 17.8, 0])
        cylinder(h=12, r=2, center=true, $fn=fragments);
        
        translate([0, 22, 12])
        cube([22, 8, 20], center=true);
        
        translate([-29.9, 0, 3])
        difference() {
            rotate([0, 45, 0])
            cube([3, 7, 3], center=true);
            translate([-4, 0, 0])
            cube([8, 8, 8], center=true);
        }
        translate([29.9, 0, 3])
        difference() {
            rotate([0, 45, 0])
            cube([3, 7, 3], center=true);
            translate([4, 0, 0])
            cube([8, 8, 8], center=true);
        }
        translate([0, 0.6, 0])
        cylinder(h=16, r=6, center=true, $fn=fragments);
        
        translate([7.4, 10, 0])
        cylinder(h=16, r=3, center=true, $fn=fragments);
    }
    translate([25, 20, 3.8])
    cylinder(h=7.6, r=3, center=true, $fn=fragments);
        
    translate([25, -20, 3.8])
    cylinder(h=7.6, r=3, center=true, $fn=fragments);
    translate([-25, -20, 3.8])
    cylinder(h=7.6, r=3, center=true, $fn=fragments);
        
    translate([0, 0, 1])
    cube([1, 16, 2], center=true);
    translate([0, 0.6, 1])
    cube([16, 1, 2], center=true);
    
}
translate([0, 70, 0])
body();

module cover() {
    module outerCorner() {
        translate([0, 0, 7])
        cylinder(h=14, r=4, center=true, $fn=fragments);
    }
    module ear() {
        difference() {
            linear_extrude(6, center=true, convexity=10) {
                offset(2, $fn=fragments)
                offset(-2, $fn=fragments)
                square(12, center=true);
            }
            linear_extrude(8, center=true, convexity=10) {
                offset(1, $fn=fragments)
                offset(-1, $fn=fragments)
                square(6, center=true);
            }
            translate([0, -9, 0])
            cube([16, 16, 16], center=true);
        }
    }
    union() {
        difference() {
            hull() {
                translate([27, 22, 0])
                outerCorner();
                translate([27, -22, 0])
                outerCorner();
                translate([-27, -22, 0])
                outerCorner();
                translate([-27, 22, 0])
                outerCorner();
            }
            translate([0, 0, 1])
            hull() {
                translate([26, 21, 0])
                scale([1, 1, 2])
                corner();
                translate([26, -21, 0])
                scale([1, 1, 2])
                corner();
                translate([-26, -21, 0])
                scale([1, 1, 2])
                corner();
                translate([-26, 21, 0])
                scale([1, 1, 2])
                corner();
            }
            hull() {
                translate([10, -11, 7])
                cylinder(h=16, r=1, center=true, $fn=fragments);
                translate([-10, -11, 7])
                cylinder(h=16, r=1, center=true, $fn=fragments);
                translate([-10, 32, 7])
                cylinder(h=16, r=1, center=true, $fn=fragments);
                translate([10, 32, 7])
                cylinder(h=16, r=1, center=true, $fn=fragments);
            }
            
            translate([20, 0, 0])
            cylinder(h=16, r=5, center=true, $fn=fragments);
            translate([-20, 0, 0])
            cylinder(h=16, r=5, center=true, $fn=fragments);
            
            //translate([-20, 8, 0])
            //eyebrow();
            //translate([-20, 10, 0])
            //eyebrow();
            //translate([20, 8, 0])
            //eyebrow();
            //translate([20, 10, 0])
            //eyebrow();
            
        }
        
        translate([21, 17, 2])
        cylinder(h=4, r=2, center=true, $fn=fragments);
        translate([-21, 17, 2])
        cylinder(h=4, r=2, center=true, $fn=fragments);
        translate([-17, -17, 2])
        cylinder(h=4, r=2, center=true, $fn=fragments);
        translate([17, -17, 2])
        cylinder(h=4, r=2, center=true, $fn=fragments);
        
        //translate([20, 25, 3])
        //difference() {
        //    rotate([0, 0, 45])
        //    cube([12, 12, 6], center=true);
        //    rotate([0, 0, 45])
        //    translate([0, 0, 0])
        //    cube([6, 6, 8], center=true);
        //    translate([0, -10, 0])
        //    cube([20, 20, 8], center=true);
        //}
        //translate([-20, 25, 3])
        //difference() {
        //    rotate([0, 0, 45])
        //    cube([12, 12, 6], center=true);
        //    rotate([0, 0, 45])
        //    translate([0, 0, 0])
        //    cube([6, 6, 8], center=true);
        //    translate([0, -10, 0])
        //    cube([20, 20, 8], center=true);
        //}
        translate([-20, 26, 3])
        ear();
        translate([20, 26, 3])
        ear();
    }
}

module eyebrow() {
    
    hull() {
        translate([4, 0, 0])
        cylinder(h=8, r=0.5, center=true, $fn=fragments);
        translate([-4, 0, 0])
        cylinder(h=8, r=0.5, center=true, $fn=fragments);
    }    
}


        
        
cover();
module claw() {
    translate([-30, 0, 11])
    difference() {
        rotate([0, 45, 0])
        cube([3, 6, 3], center=true);
        translate([-4, 0, 0])
        cube([8, 8, 8], center=true);
    }
    translate([30, 0, 11])
    difference() {
        rotate([0, 45, 0])
        cube([3, 6, 3], center=true);
        translate([4, 0, 0])
        cube([8, 8, 8], center=true);
    }
}
claw();

module arm() {
    translate([-2, -4, 0])
    rotate([0, 0, 90])
    rotate_extrude(angle = 90, convexity = 10, center=true, $fn=fragments)  {
        translate([2, 0, 0])
        polygon([
            [0, 14],
            [4, 14],
            [4, 0],
            [0, 0],
        ], paths=[
            [0, 1, 2, 3]
        ]);
    }
    translate([0, 0, 7])
    cube([4, 4, 14], center=true);
    translate([-6, -8, 7])
    cube([4, 8, 14], center=true);
}
translate([-32, 0, 0])
arm();

translate([32, 0, 0])
mirror([1, 0, 0])
arm();

module leg() {
    translate([0, 0, 7])
    cube([4, 12, 14], center=true);
}
translate([-16, -31, 0])
leg();
translate([16, -31, 0])
mirror([1, 0, 0])
leg();

