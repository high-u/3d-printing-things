fragments = 90;
isLaptop = false;

if (isLaptop) {
    translate([0, 0, 110 + 3])
    #cube([310, 16, 220], center = true);
}

lenX = 51;
lenY = 50;
lenZ = 46;

module a() {
    hull() {
        translate([0, lenY - 8 - 3, 0])
        rotate([0, 90, 0])
        cylinder(h = 16, r = 3, center = true, $fn = fragments);
        translate([0, 8 + 3, lenZ])
        rotate([0, 90, 0])
        cylinder(h = 16, r = 3, center = true, $fn = fragments);
    }
    hull() {
        translate([0, 8 + 3, lenZ + 3])
        rotate([90, 0, 0])
        difference() {
            cylinder(h = 6, r = 8, center = true, $fn = fragments);
            translate([0, -10, 0])
            cube([20, 20, 10], center = true);
        }
        translate([0, 8 + 3, lenZ])
        rotate([0, 90, 0])
        cylinder(h = 16, r = 3, center = true, $fn = fragments);
    }
    difference() {
        hull() {
            translate([0, 8 + 3, lenZ - 10])
            rotate([0, 90, 0])
            cylinder(h = 6, r = 3, center = true, $fn = fragments);
            translate([0, 8 + 3, lenZ])
            rotate([0, 90, 0])
            cylinder(h = 6, r = 3, center = true, $fn = fragments);
            translate([0, lenY - 8 - 3, 0 - 10])
            rotate([0, 90, 0])
            cylinder(h = 6, r = 3, center = true, $fn = fragments);
            translate([0, lenY - 8 - 3, 0])
            rotate([0, 90, 0])
            cylinder(h = 6, r = 3, center = true, $fn = fragments);
        }
        translate([0, 0, -20 - 3])
        cube([160, 160, 40], center = true);
    }
}

module b() {
    translate([lenX - 9, 0, 0])
    union() {
        a();
        mirror([0, 1, 0])
        a();
        hull() {
            translate([0, lenY - 8, 0])
            cylinder(h = 6, r = 8, center = true, $fn = fragments);
            translate([0, -lenY + 8, 0])
            cylinder(h = 6, r = 8, center = true, $fn = fragments);
        }
    }
    
}

b();
mirror([1, 0, 0])
b();

module c() {
    hull() {
        translate([lenX - 9, 8 + 3, 6 - 3])
        cylinder(h = 12, r = 3, center = true, $fn = fragments);
        translate([-lenX + 9, 8 + 3, 6 - 3])
        cylinder(h = 12, r = 3, center = true, $fn = fragments);
    }
    hull() {
        translate([lenX - 9, 8 + 3, 6 - 3])
        cylinder(h = 12, r = 3, center = true, $fn = fragments);
        translate([lenX - 9, lenY - 8 - 3 - 9, 6])
        rotate([0, 90, 0])
        cylinder(h = 6, r = 3, center = true, $fn = fragments);
    }
    hull() {
        translate([-lenX + 9, 8 + 3, 6 - 3])
        cylinder(h = 12, r = 3, center = true, $fn = fragments);
        translate([-lenX + 9, lenY - 8 - 3 - 9, 6])
        rotate([0, 90, 0])
        cylinder(h = 6, r = 3, center = true, $fn = fragments);
    }
}

c();
mirror([0, 1, 0])
c();
