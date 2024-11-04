fragments= 18;
isPhoneV = false;
isPhoneH = false;
isBar = false;


module bar(y, z) {
    translate([30, y, z])
    rotate([0, 90, 0])
    cylinder(h=12, r=2, center=true, $fn=fragments);
}

module arm() {
    a = -98.3;
    x = 64;
    translate([0, 0, 96])
    rotate([-25, 0, 0])
    union() {
        hull() {
            bar(0, 0);
            bar(0, a);
        }
        
        hull() {
            bar(0, a);
            bar(0, -x);
            bar(-16, -x);
        }
        hull() {
            bar(-16, -x + 6);
            bar(-16, -x);
        }
        translate([0, -16, -x])
        hull() {
            bar(0, 0);
            rotate([25, 0, 0])
            bar(0, -120);
        }
    }
    l = 42;
    translate([30, -(l / 2), 2])
    cube([12, l, 4], center=true);
}

// module side() {
//     difference() {
//         l = 42;
//         hull() {
//             translate([30, -(l / 2), 2])
//             cube([12, l, 4], center=true);
//             translate([30, -(l / 2), 20])
//             cube([12, l, 4], center=true);
//             bar(0, 108);
//         }
//         for (i = [0:5]) {
//             translate([40, 0, 12 + (17 * i)])
//             rotate([90, 0, 0])
//             linear_extrude(height = 120,  center = true, convexity = 10, $fn = fragments) {
//                 translate([0, 0, 0])
//                 circle(6, $fn=fragments);
//             }
//         }
//     }
// }

module core() {
    difference() {
        union() {
            difference() {
                union() {
                    arm();
                    mirror([1, 0, 0])
                    arm();
                }
                translate([0, 60, 60])
                cube([120, 120, 120], center=true);
                translate([0, 0, -60])
                cube([120, 120, 120], center=true);
            }
            translate([0, 0, 2])
            rotate_extrude(angle=180, convexity=10, $fn=fragments) {
                translate([30, 0, 0])
                square([12, 4], center=true);
            }
            translate([0, 0, 96])
            rotate_extrude(angle=180, convexity=10, $fn=fragments) {
                translate([30, 0, 0])
                square([12, 4], center=true);
            }

            for (i = [0:18]) {
                
                rotate([0, 0, i * 10 - 90])
                translate([0, 30, 49])
                // cube([2, 11.8, 92], center=true);
                hull () {
                    
                    translate([0, 5, 0])
                    cylinder(h=92, r=1, center=true, $fn=fragments);
                    translate([0, -5, 0])
                    cylinder(h=92, r=1, center=true, $fn=fragments);
                }
                
            }
        };
        
    }
}

// side();
// mirror([1, 0, 0])
// side();
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
