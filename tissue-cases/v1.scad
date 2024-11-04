fragments = 90; // レンダリング時は 180 推奨
x = 24;
y = 21;
a = 2;

module bar() {
    rotate([90, 0, 0])
    cylinder(h = 120, r = 0.8, center = true, $fn = fragments);
}

module point() {
    rotate([90, 0, 0])
    cylinder(h = (0.8 * 2), r = 0.8, center = true, $fn = fragments);
}

module body() {
    color("#4488cc")
    hull() {
        translate([125 + a, 0, 0 - a])
        bar();
        translate([-125 - a, 0, 0 - a])
        bar();

        translate([125 - x, 0, 0 + x])
        bar();
        translate([-125 + x, 0, 0 + x])
        bar();
    }
        
    
}



module rut() {
    translate([0, 4, 0])
    rotate([90, 0, 0])
    cylinder(h = 2, r1 = 0.8, r2 = 1.4, center = true, $fn = fragments);

    translate([0, -4, 0])
    rotate([90, 0, 0])
    cylinder(h = 2, r1 = 1.4, r2 = 0.8, center = true, $fn = fragments);
}


module ruts() {
    hull() {
        translate([125 - x, 0, 0 + x])
        rut();
        translate([-125 + x, 0, 0 + x])
        rut();
    }
    hull() {
        translate([-125 - a, 0, 0 - a])
        rut();
        translate([-125 + x, 0, 0 + x])
        rut();
    }

    hull() {
        translate([125 + a, 0, 0 - a])
        rut();
        translate([125 - x, 0, 0 + x])
        rut();
    }
    hull() {
        translate([125, 0, 0])
        rut()
        translate([-125, 0, 0])
        rut();
    }

}

difference() {
    union() {
        for (i = [-5:5]) {
            if (i != 0) {
                translate([0, i * 11, 0])
                ruts();
            }
        }
        body();
    }
    
    translate([0, 1, 0])
    hull() {
        translate([121.4, 0, 2])
        bar();
        translate([-121.4, 0, 2])
        bar();

        translate([121.4 - y, 0, 2 + y])
        bar();
        translate([-121.4 + y, 0, 2 + y])
        bar();
    }

    translate([0, 0, 22])
    cube([202, 10, 10], center = true);

    translate([0, 0, -5])
    cube([300, 200, 10], center = true);
}
// hull() {
//     translate([50, 0, 0])
//     bar2();
//     translate([-50, 0, 0])
//     bar2();
// }

