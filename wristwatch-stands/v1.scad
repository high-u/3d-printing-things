segments = 128;

translate([16, 0, 0])
outerWall();
translate([-16, 0, 0])
mirror([1, 0, 0])
outerWall();

module outerWall() {
    union() {
        rotate([0, 0, -45])
        rotate_extrude(angle=90, convexity=10, $fn=segments) {
            translate([24, 0, 0])
            polygon([
                [-4, 38],
                [0, 38],
                [0, 0],
                [-4, 0],
            ]);
        }
        rotate([0, 0, -45])
        translate([0, 22, 19])
        cylinder(h=38, r=2, center=true, $fn=segments);
        rotate([0, 0, -135])
        translate([0, 22, 19])
        cylinder(h=38, r=2, center=true, $fn=segments);
    }
}





module rist() {
    module a() {
        hull() {
            translate([16, 0, 0])
            rotate([0, 0, -45])
            translate([0, 22, 4])
            cylinder(h=8, r=2, center=true, $fn=segments);

            translate([16, 0, 0])
            rotate([0, 0, -45])
            translate([0, 14, 4])
            cylinder(h=8, r=2, center=true, $fn=segments);
        }
        hull() {
            translate([16, 0, 0])
            rotate([0, 0, -135])
            translate([-15.5, 15.5, 2])
            cylinder(h=4, r=2, center=true, $fn=segments);

            translate([16, 0, 0])
            rotate([0, 0, -135])
            translate([-10, 10, 2])
            cylinder(h=4, r=2, center=true, $fn=segments);

            // translate([16, 0, 0])
            // rotate([0, 0, -90])
            // translate([0, 22, 4])
            // cylinder(h=8, r=2, center=true, $fn=segments);
        }
    }
    difference() {
        union() {
            hull() {
                translate([16, 0, 19])
                cylinder(h=38, r=16, center=true, $fn=segments);
                translate([-16, 0, 19])
                cylinder(h=38, r=16, center=true, $fn=segments);
            }
            a();
            mirror([1, 0, 0])
            a();
            
            // 土台
            translate([37, 37, 0])
            rotate([0, 0, -45])
            translate([-2, 0, 19])
            union() {
                cube([56, 4, 38], center=true);
                translate([28, 0, 0])
                cylinder(h=38, r=2, center=true, $fn=segments);
                translate([-28, 0, 0])
                cylinder(h=38, r=2, center=true, $fn=segments);
            }
            hull() {
                translate([16, 14, 4])
                cylinder(h=8, r=2, center=true, $fn=segments);

                
                translate([21, 21, 0])
                translate([16, 14, 4])
                cylinder(h=8, r=2, center=true, $fn=segments);
            }
            
            hull() {
                translate([-16, 14, 4])
                cylinder(h=8, r=2, center=true, $fn=segments);

                translate([38, 38, 0])
                translate([-16, 14, 4])
                cylinder(h=8, r=2, center=true, $fn=segments);
            }

        }
        hull() {
            translate([16, 0, 24])
            cylinder(h=50, r=12, center=true, $fn=segments);
            translate([-16, 0, 24])
            cylinder(h=50, r=12, center=true, $fn=segments);
        }
    }

    
}

module base() {
    
    
    difference() {
        union() {
            translate([0, -14, 0])
            hull() {
                translate([23.2, 0, 19])
                cylinder(h=38, r=1, center=true, $fn=segments);
                translate([-15, -11, 19])
                cylinder(h=38, r=12, center=true, $fn=segments);
                
                
            }
            translate([9, -39, 4])
            rotate([0, 0, -45])
            difference() {
                cylinder(h=8, r=36, center=true, $fn=segments);
                cylinder(h=10, r=24, center=true, $fn=segments);
                translate([60, 0, 0])
                cube([120, 120, 10], center=true);
                translate([0, 60, 0])
                cube([120, 120, 10], center=true);
            }
        }
        translate([-15, -25, 24])
        cylinder(h=50, r=9, center=true, $fn=segments);
    
    }
}

union() {
    //translate([1.4, 70, 0])
    //base();

    //rotate([0, 0, 45])
    rist();
}

//translate([26.2, 22, 24])
//cube([1, 80, 48], center=true);

//translate([-26.2, 22, 24])
//cube([1, 80, 48], center=true);
