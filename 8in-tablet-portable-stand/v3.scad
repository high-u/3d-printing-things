fragments = 30;
clearance = 0.4;
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

module node90() {
  rotate([0, 90, 90])
  cylinder(h = 4 - clearance, r = 8, center = true, $fn = fragments);
}

module diffNode90() {
  rotate([0, 90, 90])
  cylinder(h = 8, r = 4, center = true, $fn = fragments);
}

// difference() {
//   hull() {
//     translate([0, 0, 80])
//     node();
//     translate([0, 0, 0])
//     node();
//   }
//   hull() {
//     translate([0, 0, 80])
//     diffNode();
//     translate([0, 0, 0])
//     diffNode();
//   }
// }

// translate([0, 0, 80])
// rotate([-30, 0, 0])
// union() {
//   difference() {
//     hull() {
//       rotate([0, 0, 0])
//       translate([0, 17, 0])
//       node();
//       translate([0, 0, 0])
//       node();
//     }
//     hull() {
//       rotate([0, 0, 0])
//       translate([0, 17, 0])
//       diffNode();
//       translate([0, 0, 0])
//       diffNode();
//     }
//   }
//   difference() {
//     hull() {
//       rotate([0, 0, 0])
//       translate([0, 17, 60])
//       node();
//       translate([0, 17, 0])
//       node();
//     }
//     hull() {
//       rotate([0, 0, 0])
//       translate([0, 17, 60])
//       diffNode();
//       translate([0, 17, 0])
//       diffNode();
//     }
//   }
// }

// translate([0, 0, 80])
// rotate([-30, 0, 0])
// union() {
//   hull() {
//     rotate([0, 0, 0])
//     translate([0, -6, 14])
//     nodeS();
//     translate([0, -6, 0])
//     nodeS();
//   }
// }

// difference() {
//   union() {
//     difference() {
//       hull() {
//         translate([0, 80, 0])
//         node();
//         translate([0, 0, 0])
//         node();
//       }

//       hull() {
//         translate([0, 80, 0])
//         diffNode();
//         translate([0, 0, 0])
//         diffNode();
//       }
//     }

//     translate([0, 40, 0])
//     cube([4, 12 + (clearance * 2), 16], center = true);
//   }
//   translate([0, 40, -8])
//   cube([8, 4 + clearance, 16], center = true);

// }

// translate([0, -20, 0])
// union() {
//   difference() {
//     union() {
//       difference() {
//         hull() {
//           translate([52, 0, 0])
//           node90();
//           translate([-52, 0, 0])
//           node90();
//         }
//         hull() {
//           translate([52, 0, 0])
//           diffNode90();
//           translate([-52, 0, 0])
//           diffNode90();
//         }
//       }
//       translate([40, 0, 0])
//       cube([12 + (clearance * 2), 4, 16], center = true);
//       translate([-40, 0, 0])
//       cube([12 + (clearance * 2), 4, 16], center = true);
//     }
//     translate([40, 0, 8])
//     cube([4 + clearance, 8, 16], center = true);
//     translate([-40, 0, 8])
//     cube([4 + clearance, 8, 16], center = true);
//   }
// }


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
  len = 80;
  hull() {
    translate([0, 8, 0])
    nodeS();
    translate([0, 0, 0])
    nodeS();
  }
  hull() {
    translate([0, 8, 8])
    nodeS();
    translate([0, 8, len - 10 - 5])
    nodeS();
  }
  hull() {
    translate([0, 0, 0])
    nodeS();
    translate([0, 0, len - 10])
    nodeS();
  }

  module x(h) {
    hull() {
      translate([0, 0, h])
      nodeS();
      translate([0, 8, h])
      nodeS();
    }
  }
  x(24);
  x(48);
  // x(50);
  
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
      nodeS();
      translate([0, y, 8])
      nodeS();
    }
  }
  x(24);
  x(48);
  x(72);
  // x(96);
}
foot();

// 手
translate([0, 0, 70])
rotate([-30, 0, 0])
union() {
  translate([0, 0, 8])
  rotate([-90, 0, 0])
  // #bar(34);
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



  // bar(34);
  translate([0, 16, 8])
  difference() {
    union() {
      // bar(60);
      union() {
        len = 60;
        // #hull() {
        //   translate([0, 8, 0])
        //   nodeS();
        //   translate([0, 8, 0])
        //   nodeS();
        // }
        hull() {
          translate([0, 8, 0])
          nodeS();
          translate([0, 8, len - 10])
          nodeS();
        }
        // hull() {
        //   translate([0, 12, len - 10])
        //   nodeS();
        //   translate([0, 12, len - 10])
        //   nodeS();
        // }
        hull() {
          translate([0, 0, 0])
          nodeS();
          translate([0, 0, len - 10])
          nodeS();
        }
      }
      translate([0, 4, 14])
      cube([4 - clearance, 8, 26], center = true);  // 24
    }
    translate([0, 4, 45])
    cube([8, 4, 40], center = true);
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
    w = 100;
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

    translate([0, 0 - 12, h / 2])
    cube([4 - clearance, 12, h], center = true);

    translate([0, 0 - 12 - 76, h / 2])
    cube([4 - clearance, 12, h], center = true);
  }
  translate([0, 0 - 12, 5])
  cube([8, 4, 40], center = true);

  translate([0, 0 - 12 - 76, 5])
  cube([8, 4, 40], center = true);

}
