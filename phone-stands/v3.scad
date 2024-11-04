fragments= 18;
isPhoneV = false;
isPhoneH = false;
isBar = false;


module bar(y, z) {
    translate([30, y, z])
    rotate([0, 90, 0])
    cylinder(h=12, r=2, center=true, $fn=fragments);
}

module bar0(y, z) {
    translate([0, y, z])
    rotate([0, 90, 0])
    cylinder(h=12, r=2, center=true, $fn=fragments);
}


module arm() {
    a = -64;
    x = 64;
    translate([0, -1, 96])
    rotate([-25, 0, 0])
    union() {
        translate([0, 0, -33])
        rotate([90, 0, 0])
        rotate_extrude(angle=180, convexity=10, $fn=fragments) {
            translate([30, 0, 0])
            square([12, 4], center=true);
        }
        hull() {
            translate([30, 0, -35])
            cube([12, 4, 4], center=true);
            bar(0, a);
        }
        hull() {
            bar(0, -x);
            bar(-16, -x);
        }
        hull() {
            bar(-16, -x + 6);
            bar(-16, -x);
        }
        union() {
            translate([30, 0, -64])
            rotate([-90, 0, 0])
            rotate([0, 90, 0])
            rotate_extrude(angle=25, convexity=10, $fn=fragments) {
                translate([16, 0, 0])
                square([4, 12], center=true);
            }
            translate([30, 0, -101.86])
            rotate([25, 0, 0])
            cube([12, 4, 68.7], center=true);
        }
        // translate([0, -16, -x])
        // hull() {
        //     bar(0, 0);
        //     rotate([25, 0, 0])
        //     bar(0, -120);
        // }



        // hull() {
        //     bar(0, -35);
        //     rotate([24.4, 0, 0])
        //     bar(0, -94);
        // }
    }
    l = 44;
    translate([30, -(l / 2), 2])
    cube([12, l, 4], center=true);

    translate([0, 0, 2])
    rotate_extrude(angle=180, convexity=10, $fn=fragments) {
        translate([30, 0, 0])
        square([12, 4], center=true);
    }
    
    difference() {
        // translate([0, 11.2, 50])
        // rotate([18, 0, 0])
        // #cube([12, 4, 120], center=true);
        translate([0, 30, 78])
        union() {
            // hull() {
            //     rotate([65, 0, 0])
            //     bar0(0, 40);
            //     bar0(0, 0);
            // }
            // hull() {
            //     bar0(0, -80);
            //     bar0(0, 0);
            // }
            translate([0, 0, -77.8])
            cube([4, 11.8, 80], center=true);
            translate([0, -60, -37.8])
            rotate([-25, 0, 0])
            rotate([0, 270, 0])
            rotate_extrude(angle=65, convexity=10, $fn=fragments) {
                translate([60, 0, 0])
                square([11.8, 4], center=true);
            }
            
        }
        

        translate([0, -19, 100])
        rotate([65, 0, 0])
        cube([40, 40, 40], center=true);
    }
    
    
}

module core() {
    union() {
        difference() {
            union() {
                arm();
                mirror([1, 0, 0])
                arm();
                
                
            }
            translate([0, 0, -60])
            cube([120, 120, 120], center=true);
        }
    };
}
core();

if (isPhoneV) {
    translate([0, -2, 112])
    rotate([-25, 0, 0])
    cube([72, 10, 148], center=true);
}


if (isPhoneH) {
    translate([0, -18, 78])
    rotate([-25, 0, 0])
    cube([148, 10, 72], center=true);
}

if (isBar) {
    translate([20, 58, 0])
    cube([200, 10, 10], center=true);
    translate([20, -41, 0])
    cube([200, 10, 10], center=true);
}
