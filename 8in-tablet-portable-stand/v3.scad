fragments = 120;
clearance = 0.2;
isTablet = false;

function rotatePoint(pointX, pointY, originX, originY, degree, z) = [
  (pointX - originX) * cos(degree) - (pointY - originY) * sin(degree) + originX,
  (pointY - originY) * cos(degree) + (pointX - originX) * sin(degree) + originY,
  z,
];

module newNodeS() {
  rotate([0, 0, 0])
  cylinder(h = 4 - clearance, r = 2, center = true, $fn = fragments);
}
module newNodeXS() {
  rotate([0, 0, 0])
  cylinder(h = 4 - clearance, r = 1, center = true, $fn = fragments);
}

r = -30;
h = 80;

module partition() {
  translate([0, h, 0])
  difference() {
    union() {
      hull() {
        translate(rotatePoint(16, 0, 0, 0, r, 0))
        newNodeS();
        translate(rotatePoint(16, 48, 0, 0, r, 0))
        newNodeS();
        translate(rotatePoint(24, 48, 0, 0, r, 0))
        newNodeS();
        translate(rotatePoint(24, 0, 0, 0, r, 0))
        newNodeS();
      }
      hull() {
        translate(rotatePoint(0, 0, 0, 0, r, 0))
        newNodeS();
        translate(rotatePoint(0, 8, 0, 0, r, 0))
        newNodeS();
      }
      hull() {
        translate(rotatePoint(0, 0, 0, 0, r, 0))
        newNodeS();
        translate(rotatePoint(16, 0, 0, 0, r, 0))
        newNodeS();
      }
    }
    
    hull() {
      translate(rotatePoint(20, 48 + 8, 0, 0, r, 0))
      rotate([0, 0, r])
      cube([4, 4, 8], center = true);
      translate(rotatePoint(20, 24 + 2, 0, 0, r, 0))
      rotate([0, 0, r])
      cube([4, 4, 8], center = true);
    }

  }


  union() {
    hull() {
      translate([0, 0, 0])
      newNodeXS();
      translate([0, h, 0])
      translate(rotatePoint(24, 0, 0, 0, r, 0))
      newNodeXS();
    }
  }

  union() {
    hull() {
      translate([96, 0, 0])
      newNodeXS();
      translate([0, h, 0])
      translate(rotatePoint(24, 0, 0, 0, r, 0))
      newNodeXS();
    }
  }

  union() {
    hull() {
      translate([96, 0, 0])
      newNodeS();
      translate([0, h, 0])
      translate(rotatePoint(24, 48, 0, 0, r, 0))
      newNodeS();
    }
  }


  union() {
    hull() {
      translate([0, 0, 0])
      newNodeS();
      translate([0, h, 0])
      newNodeS();
    }
  }

  union() {
    hull() {
      translate([0, 0, 0])
      newNodeS();
      translate([96, 0, 0])
      newNodeS();
    }
  }

  union() {
    hull() {
      translate([0, 0, 0])
      newNodeS();
      translate([96, 0, 0])
      newNodeS();
    }
  }
}


module notch() {
  difference() {
    union() {
      hull() {
        translate([4, 0, 0])
        newNodeS();
        translate([4, 48, 0])
        newNodeS();
        translate([-4, 48, 0])
        newNodeS();
        translate([-4, 0, 0])
        newNodeS();
      }
    }
    hull() {
      translate([0, 48 + 8, 0])
      cube([4, 4, 8], center = true);
      translate([0, 24 + 2, 0])
      cube([4, 4, 8], center = true);
    }
  }
}

module fence() {
  translate([40, 0, 0])
  notch();
  translate([-40, 0, 0])
  notch();

  hull() {
    translate([36, 48, 0])
    newNodeS();
    translate([-36, 48, 0])
    newNodeS();
  }
  hull() {
    translate([56, 0, 0])
    newNodeS();
    translate([-56, 0, 0])
    newNodeS();
  }
  hull() {
    translate([36, 48, 0])
    newNodeXS();
    translate([0, 0, 0])
    newNodeXS();
  }
  hull() {
    translate([0, 0, 0])
    newNodeXS();
    translate([-36, 48, 0])
    newNodeXS();
  }
  hull() {
    translate([44, 48, 0])
    newNodeS();
    translate([56, 0, 0])
    newNodeS();
  }
  hull() {
    translate([-44, 48, 0])
    newNodeS();
    translate([-56, 0, 0])
    newNodeS();
  }
}

translate([16, 0, 0])
partition();

translate([-16, 0, 0])
mirror([1, 0, 0])
partition();

translate([0, -64, 0])
fence();

if (isTablet) {
  translate([0, 44.5, 131])
  rotate([-30, 0, 0])
  #cube([210, 12, 130], center = true);
}

