// 穴: 5mm x 15mm
// 厚さ: 5.3mm
// 縦の距離: 40mm

fragments = 36;
isJbl = false;
isHasami = false;
isPot = false;
isPillCase = false;
isQcyEarCuff = false;
isVernierCaliper = false;
is100KinEarphoneCase = false;

x = 2.4;
y = 4.8;
module p() {
    polygon([
            [x + 2.4, y],
            [x, -y],
            [-x, -y],
            [-x + 2.4, y],
            [-x + 2.4 + 1, y + 1],
            [x + 2.4 - 1, y + 1],
        ]);
}

module p2() {
    polygon([
            [2.4, 2.4],
            [2.4, -2.4],
            [-2.4, -2.4],
            [-2.4, 2.4],
            [-2.4 + 1, 2.4 + 1],
            [2.4 - 1, 2.4 + 1],
        ]);
}

module tip() {
    rotate_extrude(angle = 360, convexity = 10, $fn=128) {
        translate([0, 0, 0])
        polygon([
            [2.4, 2.4],
            [2.4, -2.4],
            [0, -2.4],
            [0, 2.4],
            [0, 2.4 + 1],
            [2.4 - 1, 2.4 + 1],
        ]);
    }
}

// size = [37.4, 12.4, 20.2]; // JBL イヤホン
// size = [12, 4, 7.2]; // ハサミ
// size = [18, 4, 37.2]; // ノギス
// size = [50, 6.6, 0]; // IKEA Pot
// size = [22, 29, 8]; // 鼻炎薬
// size = [58, 18, 8]; // QCY イヤーカフ
size = [29, 17.4, 26.6]; // 百均イヤホンケース

d = size[0];
w = size[1];
h = size[2];


if (isJbl) {
    translate([0, -22, 0])
    #cube([56, 29, 50], center = true);
}

if (isHasami) {
    translate([0, -9, 0])
    #cube([40, 3, 24], center = true);
}

if (isPot) {
    translate([0, -40, 22])
    #cylinder(h = 53, r1 = 43 / 2, r2 = 55 / 2, center = true, $fn = fragments);
}

if (isPillCase) {
    translate([0, -14, 0])
    #cube([88, 13.2, 30.2], center = true);
}

if (isQcyEarCuff) {
    translate([0, -32, 0])
    #cube([66, 49, 25.6], center = true);
}

if (isVernierCaliper) {
    translate([0, -12, 0])
    #cube([40, 9, 84], center = true);
}

if (is100KinEarphoneCase) {
    translate([0, -18, 0])
    // #cube([66, 21, 66], center = true);
    rotate([90, 0, 0])
    #cylinder(h = 21, r = 33, center = true);
}


/////////////////////////////////////////////////

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

module half() {
    hull() {
        translate([-20 - w, -3.6, 0])
        node();
        translate([-20 - w, -3.6 - d, 0])
        node();
    }
    hull() {
        translate([-11.6, -3.6, -8.4 - h])
        rotate([0, 90, 0])
        node();
        translate([-11.6, -3.6 - d, -8.4 - h])
        rotate([0, 90, 0])
        node();
    }

    hull() {
        translate([-9.2, -3.6, -8.4 - h])
        node();
        translate([0, -3.6, -8.4 - h])
        scale([0.5, 1, 1])
        rotate([0, 90, 0])
        xyz();
    }

    module fence() {
        hull() {
            translate([-20 - w, -3.6, 0])
            node();
            translate([-18.8, -3.6, 0])
            scale([0.5, 1, 1])
            rotate([0, 90, 0])
            xyz();
        }

        

        translate([-17.6, -3.6, -6])
        curve();

        hull() {
            translate([-11.6, -3.6, -8.4 - h])
            rotate([0, 90, 0])
            node();
            translate([-11.6, -3.6, -7.2])
            scale([1, 1, 0.5])
            xyz();
        }

    }
    fence();
    translate([0, -d, 0])
    fence();


    module hook() {
        translate([0, 4.8 - 1, 0])
        cube([4.8, 10, 4.8], center = true);
        translate([0, 5.4 + 2.4, -2.6])
        cube([4.8, 4.8, 10], center = true);
    }
    translate([-20, 0, 0])
    hook();
}

half();
mirror([1, 0, 0])
half();
