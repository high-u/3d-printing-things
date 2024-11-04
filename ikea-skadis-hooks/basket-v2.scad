// 穴: 5mm x 15mm
// 厚さ: 5.3mm
// 縦の距離: 40mm

fragments = 36;
is3in1B = false;
isCycleLight = false;
isPliers = false;
isMobileKeyboard = false;
isSoundPeats = false;

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
    rotate_extrude(angle = 360, convexity = 10, $fn=fragments) {
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

// size = [28, 3.4, 22, 1]; // モバイルバッテリー 3in1
// size = [32, 14, 6.6, 1]; // 自転車ライト
size = [28, 0, 19, 1]; // ニッパー＆ペンチ
// size = [21, 17, 51, 3]; // 折りたたみキーボード
// size = [30, 7, 26, 1]; // SoundPeats イヤホン

d = size[0];
w = size[1];
h = size[2];
hole = size[3];





if (is3in1B) {
    translate([20, -21, 20])
    #cube([78, 27, 57], center = true);
}

if (isCycleLight) {
    translate([20, -23, 20 + 2.4])
    #cube([99, 31, 31], center = true);
}

if (isPliers) {
    translate([40, -16, 0])
    #cube([80, 20, 57], center = true);
}

if (isMobileKeyboard) {
    translate([60, -17, 20])
    #cube([184, 19, 115], center = true);
}

if (isSoundPeats) {
    translate([20, -22, 20])
    #cube([85, 29, 65], center = true);
}

///////////////////////////

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



module fence() {

    translate([-6, 0, 14])
    curve();

    hull() {
        translate([0, 0, 12.8])
        scale([1, 1, 0.5])
        xyz();
        
        translate([0, 0, 10 - h])
        rotate([0, 90, 0])
        node();
    }

    hull() {
        translate([0 - 2.4 - 6, 0, 20])
        rotate([0, 90, 0])
        xyz();
        
        translate([-20 - w, 0, 20])
        rotate([0, 0, 0])
        node();
    }
}


module hook() {
    hull() {
        translate([0, 7.8, 0])
        cube([4.8, 4.8, 4.8], center=true);
        translate([0, 7.8, -5.2])
        cube([4.8, 4.8, 4.8], center=true);
    }
    hull() {
        translate([0, 7.8, 0])
        cube([4.8, 4.8, 4.8], center=true);
        translate([0, 0, 0])
        cube([4.8, 4.8, 4.8], center=true);
    }

}

module body() {
    hull() {
        translate([0, -3.6, 10 - h])
        rotate([0, 90, 0])
        node();
        
        translate([0, -10.8 - d, 10 - h])
        rotate([0, 90, 0])
        node();
    }


    hull() {
        translate([-20 - w, -3.6, 20])
        rotate([0, 0, 0])
        node();

        translate([-20 - w, -10.8 - d, 20])
        rotate([0, 0, 0])
        node();
    }

    translate([0, -3.6, 0])
    fence();
    hull() {
        translate([0, -3.6, 8])
        rotate([0, 90, 0])
        node();
        translate([0, -3.6, -6.4])
        rotate([0, 90, 0])
        node();
    }
    


    translate([0, -10.8 - d, 0])
    fence();

    translate([0, 0, 0])
    hook();
    translate([-20, 0, 20])
    hook();
}


body();

translate([ (hole * 40), 0, 0])
mirror([1, 0, 0])
body();
