// 幅60, 高さ60, 奥行き40

fragments=128;
module block(r, h, w, d) {
    hull() {
        translate([d/2-r, w/2-r, 0])
        cylinder(h=h, r=r, center=true, $fn=fragments);
        translate([d/2-r, -(w/2-r), 0])
        cylinder(h=h, r=r, center=true, $fn=fragments);
        translate([-(d/2-r), -(w/2-r), 0])
        cylinder(h=h, r=r, center=true, $fn=fragments);
        translate([-(d/2-r), w/2-r, 0])
        cylinder(h=h, r=r, center=true, $fn=fragments);
    }
}

difference() {
    block(16, 60, 144, 104);
    
    translate([24, 34, 4])
    block(8, 60, 60, 40);
    
    translate([24, -34, 4])
    block(8, 60, 60, 40);
    
    translate([-24, -34, 4])
    block(8, 60, 60, 40);
    
    translate([-24, 34, 4])
    block(8, 60, 60, 40);
}
