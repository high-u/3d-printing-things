// 幅60, 高さ60, 奥行き40

fragments=128;

module block2(r, h, w, d) {
    linear_extrude(h, center=true, convexity=10) {
        offset(r, $fn=fragments)
        offset(-r, $fn=fragments)
        square([d, w], center=true);
    }
}

difference() {
    block2(16, 60, 152, 76);
    
    translate([0, 0, 4])
    block2(8, 60, 40, 60);
    
    translate([0, 48, 4])
    block2(8, 60, 40, 60);
    
    translate([0, -48, 4])
    block2(8, 60, 40, 60);
    
}
