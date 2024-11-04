// 穴: 5mm x 15mm
// 厚さ: 5.3mm
// 縦の距離: 40mm

fragments = 36;

hook1 = 24;
hook2 = 36;
hook3 = 48;


// module tip() {
//     translate([0, 0, 0])
//     rotate_extrude(angle = 360, convexity = 10, $fn = fragments) {
//         translate([0, 0, 0])
//         polygon([
//             [0, 2.4 + 1],
//             [1.4, 2.4 + 1],
//             [2.4, 2.4],
//             [2.4, -2.4],
//             [0, -2.4],
//         ]);
//     }
// }

// module hook48() {
//     translate([40, 6, 0])
//     cube([4.8, 12, 4.8], center=true);
//     translate([5 - 2.4 + 40, 5.4 + 4.8, 0])
//     cube([10, 4.8, 4.8], center=true);

//     translate([0, 6, 0])
//     cube([4.8, 12, 4.8], center=true);
//     translate([5 - 2.4, 5.4 + 4.8, 0])
//     cube([10, 4.8, 4.8], center=true);


//     // translate([0, -10, 0])
//     // cube([4.8, 20, 4.8], center=true);
//     len = 48;

//     union() {
//         hull() {
//             translate([0, 0, 0])
//             // cube([4.8, 4.8, 4.8], center=true);
//             tip();
//             translate([40, 0, 0])
//             // cylinder(h=4.8, r=2.4, center=true, $fn=fragments);
//             tip();
//         }
//         hull() {
//             translate([0, -len, 0])
//             // cylinder(h=4.8, r=2.4, center=true, $fn=fragments);
//             tip();
//             translate([-4.8, -len - 2.4, 0])
//             // cylinder(h=4.8, r=2.4, center=true, $fn=fragments);
//             tip();
//         }
//         hull() {
//             translate([0, -len, 0])
//             // cylinder(h=4.8, r=2.4, center=true, $fn=fragments);
//             tip();
//             translate([0, 0, 0])
//             // cylinder(h=4.8, r=2.4, center=true, $fn=fragments);
//             tip();
//         }
//         hull() {
//             translate([0, -len, 0])
//             // cylinder(h=4.8, r=2.4, center=true, $fn=fragments);
//             tip();
//             translate([20, 0, 0])
//             // cylinder(h=4.8, r=2.4, center=true, $fn=fragments);
//             tip();
//         }
//     }
    

// }
// translate([80, 0, -10])
// hook48();
// mirror([0, 1, 0])
// translate([80, -30, -10])
// hook48();


// module hook36() {
//     translate([40, 6, 0])
//     cube([4.8, 12, 4.8], center=true);
//     translate([5 - 2.4 + 40, 5.4 + 4.8, 0])
//     cube([10, 4.8, 4.8], center=true);

//     translate([0, 6, 0])
//     cube([4.8, 12, 4.8], center=true);

    
//     translate([5 - 2.4, 5.4 + 4.8, 0])
//     cube([10, 4.8, 4.8], center=true);


//     // translate([0, -10, 0])
//     // cube([4.8, 20, 4.8], center=true);
//     len = 36;

//     union() {
//         hull() {
//             translate([0, 0, 0])
//             // cube([4.8, 4.8, 4.8], center=true);
//             tip();
//             translate([40, 0, 0])
//             // cylinder(h=4.8, r=2.4, center=true, $fn=fragments);
//             tip();
//         }

//         hull() {
//             translate([0, -len, 0])
//             // cylinder(h=4.8, r=2.4, center=true, $fn=fragments);
//             tip();
//             translate([-4.8, -len - 2.4, 0])
//             // cylinder(h=4.8, r=2.4, center=true, $fn=fragments);
//             tip();
//         }
//         hull() {
//             translate([0, -len, 0])
//             // cylinder(h=4.8, r=2.4, center=true, $fn=fragments);
//             tip();
//             translate([0, 0, 0])
//             // cylinder(h=4.8, r=2.4, center=true, $fn=fragments);
//             tip();
//         }
//         hull() {
//             translate([0, -len, 0])
//             // cylinder(h=4.8, r=2.4, center=true, $fn=fragments);
//             tip();
//             translate([20, 0, 0])
//             // cylinder(h=4.8, r=2.4, center=true, $fn=fragments);
//             tip();
//         }
//     }
    

// }
// translate([0, 0, -10])
// hook36();
// mirror([0, 1, 0])
// translate([0, -30, -10])
// hook36();


// module hook24() {
//     translate([40, 6, 0])
//     cube([4.8, 12, 4.8], center=true);
//     translate([5 - 2.4 + 40, 5.4 + 4.8, 0])
//     cube([10, 4.8, 4.8], center=true);

//     translate([0, 6, 0])
//     cube([4.8, 12, 4.8], center=true);

//     translate([5 - 2.4, 5.4 + 4.8, 0])
//     cube([10, 4.8, 4.8], center=true);


//     // translate([0, -10, 0])
//     // cube([4.8, 20, 4.8], center=true);
//     len = 24;

//     union() {
//         hull() {
//             translate([0, 0, 0])
//             // cube([4.8, 4.8, 4.8], center=true);
//             tip();
//             translate([40, 0, 0])
//             // cylinder(h=4.8, r=2.4, center=true, $fn=fragments);
//             tip();
//         }
//         hull() {
//             translate([0, -len, 0])
//             // cylinder(h=4.8, r=2.4, center=true, $fn=fragments);
//             tip();
//             translate([-4.8, -len - 2.4, 0])
//             // cylinder(h=4.8, r=2.4, center=true, $fn=fragments);
//             tip();
//         }
//         hull() {
//             translate([0, -len, 0])
//             // cylinder(h=4.8, r=2.4, center=true, $fn=fragments);
//             tip();
//             translate([0, 0, 0])
//             // cylinder(h=4.8, r=2.4, center=true, $fn=fragments);
//             tip();
//         }
//         hull() {
//             translate([0, -len, 0])
//             // cylinder(h=4.8, r=2.4, center=true, $fn=fragments);
//             tip();
//             translate([20, 0, 0])
//             // cylinder(h=4.8, r=2.4, center=true, $fn=fragments);
//             tip();
//         }
//     }
    

// }
// translate([-80, 0, -10])
// hook24();
// mirror([0, 1, 0])
// translate([-80, -30, -10])
// hook24();

////////////////////////////////////////

module poly() {
    polygon([
        [1.2, 2.4 + 1.2],
        [2.4, 1.2 + 1.2],
        [2.4, -1.2 - 1.2],
        [1.2, -2.4 - 1.2],
        [-1.2, -2.4 - 1.2],
        [-2.4, -1.2 - 1.2],
        [-2.4, 1.2 + 1.2],
        [-1.2, 2.4 + 1.2],
    ]);
}

module xyz() {
    linear_extrude(height = 4.8, center = true, convexity = 10, $fn = fragments) {
        poly();
    }
}
module abc() {
    
    intersection() {
        xyz();
        rotate([0, 90, 0])
        xyz();

    }

}
module node() {
    union() {
        abc();
        rotate([0, 0, 90])
        abc();
    }
}




module curve() {
    rotate([90, 0, 0])
    rotate_extrude(angle = 90, convexity = 10, $fn = fragments) {
        translate([6, 0, 0])
        poly();
    }
}

module joint() {
    union() {
        translate([0, 0, 1.8])
        cylinder(h = 1.2, r1 = 2.4 + 1.2, r2 = 2.4, center = true, $fn = fragments);
        translate([0, 0, 0])
        cylinder(h = 2.4, r = 2.4 + 1.2, center = true, $fn = fragments);
        translate([0, 0, -1.8])
        cylinder(h = 1.2, r1 = 2.4, r2 = 2.4 + 1.2, center = true, $fn = fragments);
    }
}

module h(len) {
    translate([0, 6, 0])
    cube([4.8, 12, 4.8], center=true);
    translate([5 - 2.4 + 0, 5.4 + 4.8 + 1.2, 0])
    cube([10, 4.8, 4.8], center=true);
}

module hookBody(len) {
    hull() {
        translate([0, 0, 0])
        node();
        translate([40 + 6.0, 0, 0])
        node();
    }

    hull() {
        translate([0, 0, 0])
        node();
        translate([0, -len, 0])
        joint();
    }

    hull() {
        translate([0, -len, 0])
        joint();
        translate([0 - 6, -len - 6, 0])
        rotate([0, 0, 45])
        node();
    }

    hull() {
        translate([0, -len, 0])
        joint();
        translate([20, 0, 0])
        joint();
    }



    h();
    translate([40, 0, 0])
    h();
}

hookBody(hook1);

translate([60, 0, 0])
hookBody(hook2);

translate([120, 0, 0])
hookBody(hook3);
