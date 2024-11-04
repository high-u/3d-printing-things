fragments= 128;
isPhoneV = false;
isPhoneH = false;
isBar = false;

module c0602() {
    rotate([0, 0, 25])
    translate([-116, 0, 0])
    cylinder(h=12, r=2, center=true, $fn=fragments);
}
module c0603() {
    rotate([0, 0, -25])
    translate([-116, 0, 0])
    cylinder(h=12, r=2, center=true, $fn=fragments);
}


module c01() {
    rotate([0, 0, 25])
    translate([-66, -16, 0])
    cylinder(h=12, r=2, center=true, $fn=fragments);
}
module c02() {
    rotate([0, 0, 25])
    translate([-72, -16, 0])
    cylinder(h=12, r=2, center=true, $fn=fragments);
}
module c03() {
    rotate([0, 0, 25])
    rotate([0, 0, 180])
    translate([72, 0, 0])
    cylinder(h=12, r=2, center=true, $fn=fragments);
}
module c04() {
    rotate([0, 0, 0])
    translate([0, 0, 0])
    cylinder(h=12, r=2, center=true, $fn=fragments);
            
}


module base() {
    union() {
        hull() {
            c01();
            c02();
        }
        hull() {
            c02();
            c03();
            c0602();
        }
            
        
        hull() {
            c04();
            c0602();
        }
        hull() {
            c04();
            c0603();
        }
        hull() {
            c0602();
            c0603();
        }
        
        
    }
    
}

module a() {
    translate([0, 0, 30])
    base();

    hull() {
        translate([0, 0, 30])
        c04();
        c04();
        c0603();
        translate([0, 0, 30])
        c0603();
    }
}

module body() {
    a();
    mirror([0,0,1])
    a();
}

translate([0, 0, 110])
rotate([0, -90, 0])
body();

if (isPhoneV) {
    translate([0, -5, 118])
    rotate([-25, 0, 0])
    cube([72, 10, 148], center=true);
}


if (isPhoneH) {
    translate([0, -21, 83])
    rotate([-25, 0, 0])
    cube([148, 10, 72], center=true);
}

if (isBar) {
    translate([20, 58, 0])
    cube([200, 10, 10], center=true);
    translate([20, -41, 0])
    cube([200, 10, 10], center=true);
}
