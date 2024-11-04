isPreview = false;
isDanmen = false;
fragments = 64;

clearance = 0.1;
hingeClearance = 0.2;

if (isPreview) {
    for(a = [-20:20]) {
        color( "#ff0000" )
        translate([a * 4, 0, 0])
        rotate([90, 0, 0])
        cylinder(h=100, r=0.05, center=true);
    }
    
    for(a = [-12:12]) {
        color( "#00ff00" )
        translate([0, a * 4, 0])
        rotate([0, 90, 0])
        cylinder(h=160, r=0.05, center=true);
    }
    
    for (i = [-20:20]) {
        color( "#0000ff" )
        translate([i * 4, 0, 0])
        rotate([0, 0, 0])
        cylinder(h=30, r=0.05, center=true);
    }
}

function rotatePoint(pointX, pointY, originX, originY, degree) =
    [
        (pointX - originX) * cos(degree) - (pointY - originY) * sin(degree) + originX,
        (pointY - originY) * cos(degree) + (pointX - originX) * sin(degree) + originY,
    ];

module totsu(x, y, degree) {
    translate([x, y, 4.2]) // 中心は 4 だけど、微妙に底に当たるので 0.2 上にずらしている。
    rotate([90, 0, degree])
    translate([0, 0, -1])
    cylinder(
        h=3,
        r1=3,
        r2=0,
        center=false,
        $fn=64
    );
}

module ou(x, y, degree) {
    translate([x, y, 4.2]) // 中心は 4 だけど、微妙に底に当たるので 0.2 上にずらしている。
    rotate([90, 0, degree])
    cylinder(
        h=2,
        r1=(2 + hingeClearance),
        r2=(hingeClearance),
        center=false,
        $fn=64
    );
}

module outerBar(length, angle, x, y) {
    translate([x, y, 0])
    rotate([90, 0, angle])
    linear_extrude(height = length - (clearance * 2), center = true, convexity = 10) {
        polygon([
            [2 - clearance, 10],
            [4 - clearance, 8],
            [4 - clearance, 0],
            [-4 + clearance, 0],
            [-4 + clearance, 8],
            [-2 + clearance, 10],
        ], paths=[
            [0, 1, 2, 3, 4, 5]
        ]);
    }
}
module connectorBar(length, angle, x, y) {
    translate([x, y, 4])
    rotate([0, 0, angle])
    cube([length - (clearance * 2), 4 - (clearance * 2), 8], center=true);
}

module hinjiBar(length, angle, x, y) {

    translate([x, y, 0])
    rotate([90, 0, angle])
    linear_extrude(
        height = (length - (clearance * 2)),
        center = true,
        convexity = 10
    ) {
        polygon([
            [1.6 - clearance, 8],
            [4 - clearance, 5.6],
            [4 - clearance, 2.4],
            [1.6 - clearance, 0],
            [-1.6 + clearance, 0],
            [-4 + clearance, 2.4],
            [-4 + clearance, 5.6],
            [-1.6 + clearance, 8],
        
        ], paths=[
            [0, 1, 2, 3, 4, 5, 6, 7]
        ]);
    }
}

//translate([0,0,20])
//hinjiBar(20, 0, 0, 0);

module smallBar(length, angle, x, y) {

    translate([x, y, 0])
    rotate([90, 0, angle])
    linear_extrude(
        height = (length - (clearance * 2)),
        center = true,
        convexity = 10
    ) {
        polygon([
            [1 - clearance, 4],
            [2 - clearance, 3],
            [2 - clearance, 1],
            [1 + clearance, 0],
            [-1 + clearance, 0],
            [-2 + clearance, 1],
            [-2 + clearance, 3],
            [-1 + clearance, 4],
        ], paths=[
            [0, 1, 2, 3, 4, 5, 6, 7]
        ]);
    }
}

module leg1() {
    
    module bars() {
        connectorBar(56, 0, -9, 8);
        connectorBar(38, 0, -9, 0);

        hinjiBar(8, 0, 19, 10);
        hinjiBar(20, 0, 10, 0);
        hinjiBar(4, 0, -37, 8);
        hinjiBar(20, 0, -28, 0);
    }
    bars();
    mirror([0, 1, 0])
    bars();
}

module leg2() {
    module bars() {
        hinjiBar(12, 0, -37, 20);
        hinjiBar(52, 0, 28, 0);
        hinjiBar(12, 0, 19, 20);
        hinjiBar(12, 0, 19, 0);

        connectorBar(66, 0, -5, 24);
        connectorBar(66, 0, -5, 16);
        connectorBar(10, 0, 23, 4);
        
        

        smallBar(8, 0, -36, 26);
    }
    bars();
    mirror([0, 1, 0])
    bars();
}

module arm2() {
    module armCorner() {
        rotate_extrude(angle = 90, convexity = 10, $fn=fragments) {
            translate([0, 0, 0])
            polygon([
                [0, 8],
                [4 - (clearance * 2), 8],
                [4 - (clearance * 2), 0],
                [0, 0]
            ], paths=[
                [0, 1, 2, 3]
            ]);
        }
    }
    
    
    
    module bars() {
        hinjiBar(60, 0, -63, 0);
        connectorBar(12.2, 0, -57, 28);
        connectorBar(52.4, 90, -49.1, 0);
        // #connectorBar(50, 90, -56, 4);
        translate([-51, 26.1, 0])
        armCorner();
    }
    bars();
    mirror([0, 1, 0])
    bars();
}

module frame2() {
    module corner(x, y) {
        translate([x, y, 4])
        cylinder(h=8, r=2-clearance, center=true, $fn=fragments);
        translate([x, y, 9])
        cylinder(h=2, r1=2-clearance, r2=0, center=true, $fn=fragments);
    }
    module outCorner(radius, degree, x, y) {
        translate([x, y, 0])
        rotate([0, 0, degree])
        rotate_extrude(angle = 90, convexity = 10, $fn=fragments) {
            polygon([
                [0, 10],
                [radius - clearance, 10],
                [radius - clearance, 0],
                [0, 0]
            ], paths=[
                [0, 1, 2, 3]
            ]);
        }
    }
    module o1() {
        hull() {
            outCorner(4, 0, 38.6, 32.1);
            corner(38.5, 32);
        }
    }
    module o2() {
        hull() {
            outCorner(4, 90, -70.1, 32.1);
            corner(-70, 32);
        }
    }
    module o3() {
        hull() {
            outCorner(4, 180, -70.1, -32.1);
            corner(-70, -32);
        }
    }
    module o4() {
        hull() {
            outCorner(4, 270, 38.6, -32.1);
            corner(38.5, -32);
        }
    }
    
    union() {
        hull() {
            o1();
            o2();
        }
        hull() {
            o1();
            o4();
        }
        hull() {
            o3();
            o4();
        }
        hull() {
            o2();
            o3();
        }
    }
    module bars() {
        difference() {
            union() {
                connectorBar(61, 0, 8, 28);
                connectorBar(61, 0, 8, 30);
            }
            for (i = [0:4]) {
                translate([(i * 12) - 16, 32, 8])
                cube([5, 16, 8], center=true);
            }
        }
        hinjiBar(12, 0, -37, 0);
        hinjiBar(4, 0, -37, 12);
        connectorBar(8, 0, -41, 12);
        connectorBar(8, 0, -41, 4);
        connectorBar(68, 90, -44, 0);

    }
    bars();
    mirror([0, 1, 0])
    bars();
    
    hull() {
        translate([34 + 0.1, 13  - 0.1, 4])
        cylinder(h = 8, r = 1, center = true, $fn = fragments);
        translate([39 + 0.1, 13  - 0.1, 4])
        cylinder(h = 8, r = 1, center = true, $fn = fragments);
        translate([34 + 0.1, - 13  + 0.1, 4])
        cylinder(h = 8, r = 1, center = true, $fn = fragments);
        translate([39 + 0.1, - 13  + 0.1, 4])
        cylinder(h = 8, r = 1, center = true, $fn = fragments);

    }
    
    // #connectorBar(28, 90, 35, 0);

}

module all() {
    color("#88ccff")
    frame2();
    color("#ccccff")
    arm2();
    color("#88cc88")
    leg1();
    color("#88cccc")
    leg2();
}

module all2() {
    hinji = [
        [-64, 30, 0], // 中心は -63 だけど、arm を立たせるためにずらしている。
        //[-63, -14, 0],
        [-37, -10, 0],
        [-37, 6, 0],
        [19, -14, 0],
        [19, -6, 180],
    ];
    module totsus() {
        for (i = hinji) {
            totsu(i[0], i[1], i[2]);
        }
    }
    totsus();
    mirror([0, 1, 0])
    totsus();
    module ous() {
        for (i = hinji) {
            ou(i[0], i[1], i[2]);
        }
    }
    difference() {
        all();
        ous();
        mirror([0, 1, 0])
        ous();
    }
}

if (isDanmen) {
    difference() {
        all2();
        color("#88ff88")
        translate([0, 0, 8.2])
        cube([150, 100, 8], center=true);
    }

} else {
    all2();
}
