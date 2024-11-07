fragments = 30;
clearance = 0.2;
isTablet = false;

module node() {
  rotate([0, 90, 0])
  cylinder(h = 4 - clearance, r = 8, center = true, $fn = fragments);
}

module diffNode() {
  rotate([0, 90, 0])
  cylinder(h = 8, r = 4, center = true, $fn = fragments);
}

module nodeS() {
  rotate([0, 90, 0])
  cylinder(h = 4 - clearance, r = 2, center = true, $fn = fragments);
}
module nodeXS() {
  rotate([0, 90, 0])
  cylinder(h = 4 - clearance, r = 1, center = true, $fn = fragments);
}

module node90() {
  rotate([0, 90, 90])
  cylinder(h = 4 - clearance, r = 8, center = true, $fn = fragments);
}

module diffNode90() {
  rotate([0, 90, 90])
  cylinder(h = 8, r = 4, center = true, $fn = fragments);
}



if (isTablet) {
  translate([0, 44.5, 131])
  rotate([-30, 0, 0])
  #cube([210, 12, 130], center = true);
}


///////////

module bar(len) {
  hull() {
    translate([0, 12, 0])
    nodeS();
    translate([0, 12, 0])
    nodeS();
  }
  hull() {
    translate([0, 12, 0])
    nodeS();
    translate([0, 12, len - 10])
    nodeS();
  }
  hull() {

    translate([0, 12, len - 10])
    nodeS();
    translate([0, 12, len - 10])
    nodeS();
  }
  hull() {
    translate([0, 0, 0])
    nodeS();
    translate([0, 0, len - 10])
    nodeS();
  }
}

// 柱
module leg() {
  len = 72;
  hull() {
    translate([0, 8, 0])
    nodeS();
    translate([0, 0, 0])
    nodeS();
  }
  hull() {
    translate([0, 8, 8])
    nodeS();
    translate([0, 8, len - 5])
    nodeS();
  }
  hull() {
    translate([0, 0, 0])
    nodeS();
    translate([0, 0, len])
    nodeS();
  }

  module x(h) {
    hull() {
      translate([0, 0, h])
      nodeXS();
      translate([0, 8, h])
      nodeXS();
    }
  }
  x(24);
  x(48);
  // for (i = [0:3]) {
  //   hull() {
  //     translate([0, 8, 8 + (i * 16)])
  //     nodeXS();
  //     translate([0, 0, 16 + (i * 16)])
  //     nodeXS();
  //   }
  //   hull() {
  //     translate([0, 0, 0 + (i * 16)])
  //     nodeXS();
  //     translate([0, 8, 8 + (i * 16)])
  //     nodeXS();
  //   }
  // }
  // hull() {
  //   translate([0, 0, 0 + (4 * 16)])
  //   nodeXS();
  //   translate([0, 8 - 3, 8 + (4 * 16) - 3])
  //   nodeXS();
  // }
  
}
leg();

// 底
module foot() {
  len = 96;
  hull() {
    translate([0, len, 0])
    nodeS();
    translate([0, 0, 0])
    nodeS();
  }
  hull() {
    translate([0, len, 0])
    nodeS();
    translate([0, len - 8, 8])
    nodeS();
  }
  hull() {
    translate([0, len - 8, 8])
    nodeS();
    translate([0, 8, 8])
    nodeS();
  }
  hull() {
    translate([0, 0, 0])
    nodeS();
    translate([0, 8, 8])
    nodeS();
  }

  module x(y) {
    hull() {
      translate([0, y, 0])
      nodeXS();
      translate([0, y, 8])
      nodeXS();
    }
  }
  x(24);
  x(48);
  x(72);
  // for (i = [0:4]) {
  //   hull() {
  //     translate([0, 16 + (i * 16), 0])
  //     nodeXS();
  //     translate([0, 8 + (i * 16), 8])
  //     nodeXS();
  //   }
  //   hull() {
  //     translate([0, 24 + (i * 16), 8])
  //     nodeXS();
  //     translate([0, 16 + (i * 16), 0])
  //     nodeXS();
  //   }
  // }
  

  
}
foot();

// 手
translate([0, 0, 72])
rotate([-30, 0, 0])
union() {
  translate([0, 0, 8])
  rotate([-90, 0, 0])
  
  union () {
    len = 34;
    hull() {
      translate([0, 8, 0])
      nodeS();
      translate([0, 0, 0])
      nodeS();
    }
    hull() {
      translate([0, 8, 0])
      nodeS();
      translate([0, 8, len - 10])
      nodeS();
    }
    hull() {
      translate([0, 8, len - 10])
      nodeS();
      translate([0, 0, len - 10])
      nodeS();
    }
    hull() {
      translate([0, 0, 0])
      nodeS();
      translate([0, 0, len - 10])
      nodeS();
    }

    
  }



  translate([0, 16, 8])
  union() {
    len = 60;
    hull() {
      translate([0, 8, 0])
      nodeS();
      translate([0, 8, len - 10])
      nodeS();
    }
    hull() {
      translate([0, 0, 0])
      nodeS();
      translate([0, 0, len - 10])
      nodeS();
    }
  translate([0, 4, 13])
    cube([4 - clearance, 8, 26], center = true);  // 24
  }
  
  hull() {
      translate([0, 0, 0])
      nodeS();
      translate([0, 0, 16])
      nodeS();
  }
}

translate([0, -20, 0])
difference() {
  union() {
    w = 104;
    h = 50;
    hull() {
      translate([0, -w, 0])
      nodeS();
      translate([0, 0, 0])
      nodeS();
    }
    hull() {
      translate([0, 0, 0])
      nodeS();
      translate([0, 0, h])
      nodeS();
    }
    hull() {

      translate([0, -w, h])
      nodeS();
      translate([0, 0, h])
      nodeS();
    }
    hull() {
      translate([0, -w, h])
      nodeS();
      translate([0, -w, 0])
      nodeS();
    }


    translate([0, 0 - 16 - 48, h / 2])
    cube([4 - clearance, 2, h], center = true);
    translate([0, 0 - 16 - 24, h / 2])
    cube([4 - clearance, 2, h], center = true);
    // hull() {
    //   translate([0, 0 - (16 * -1) - 32, 0 + 32])
    //   nodeXS();
    //   translate([0, 0 - (16 * -1 + 50), 50])
    //   nodeXS();
    // }
    // hull() {
    //   translate([0, 0 - (16 * 0) - 16, 0 + 16])
    //   nodeXS();
    //   translate([0, 0 - (16 * 0 + 50), 50])
    //   nodeXS();
    // }
    // hull() {
    //   translate([0, 0 - (16 * 1), 0])
    //   nodeXS();
    //   translate([0, 0 - (16 * 1 + 50), h])
    //   nodeXS();
    // }
    // hull() {
    //   translate([0, 0 - (16 * 2), 0])
    //   nodeXS();
    //   translate([0, 0 - (16 * 2 + 50), h])
    //   nodeXS();
    // }
    // hull() {
    //   translate([0, 0 - (16 * 3), 0])
    //   nodeXS();
    //   translate([0, 0 - (16 * 3 + 50) + 10, 50 - 10])
    //   nodeXS();
    // }
    // hull() {
    //   translate([0, 0 - (16 * 4), 0])
    //   nodeXS();
    //   translate([0, 0 - (16 * 4 + 50) + 26, 50 - 26])
    //   nodeXS();
    // }
    // hull() {
    //   translate([0, 0 - (16 * 5), 0])
    //   nodeXS();
    //   translate([0, 0 - (16 * 5 + 50) + 42, 50 - 42])
    //   nodeXS();
    // }

    // hull() {
    //   translate([0, 0 - (16 * -1) - 32, 50 - 32])
    //   nodeXS();
    //   translate([0, 0 - (16 * -1 + 50), 0])
    //   nodeXS();
    // }
    // hull() {
    //   translate([0, 0 - (16 * 0) - 16, 50 - 16])
    //   nodeXS();
    //   translate([0, 0 - (16 * 0 + 50), 0])
    //   nodeXS();
    // }
    // hull() {
    //   translate([0, 0 - (16 * 1), 50])
    //   nodeXS();
    //   translate([0, 0 - (16 * 1 + 50), 0])
    //   nodeXS();
    // }
    // hull() {
    //   translate([0, 0 - (16 * 2), 50])
    //   nodeXS();
    //   translate([0, 0 - (16 * 2 + 50), 0])
    //   nodeXS();
    // }
    // hull() {
    //   translate([0, 0 - (16 * 3), 50])
    //   nodeXS();
    //   translate([0, 0 - (16 * 3 + 50 - 10), 0 + 10])
    //   nodeXS();
    // }
    // hull() {
    //   translate([0, 0 - (16 * 4), 50])
    //   nodeXS();
    //   translate([0, 0 - (16 * 4 + 50 - 10 - 16), 0 + 10 + 16])
    //   nodeXS();
    // }
    // hull() {
    //   translate([0, 0 - (16 * 5), 50])
    //   nodeXS();
    //   translate([0, 0 - (16 * 5 + 50 - 10 - 32), 0 + 10 + 32])
    //   nodeXS();
    // }


    translate([0, 0 - 12, h / 2])
    cube([4 - clearance, 12, h], center = true);

    translate([0, 0 - 12 - 80, h / 2])
    cube([4 - clearance, 12, h], center = true);
  }
  translate([0, 0 - 12, 5])
  cube([8, 4, 40], center = true);

  translate([0, 0 - 12 - 80, 5])
  cube([8, 4, 40], center = true);

}
