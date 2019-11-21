difference() {
    translate([0, 0, -2]){
        cube([15, 60, 88]);
    }
    
    // Aushöhlen der Rechtecke
    translate([-1, 2, 0]) {
        cube([10, 56, 84]);
    }
    translate([-1, 2, 36]) {
        cube([100, 39, 48]);
    }
    
    // Aussparung fuer Display
    translate([-1, 40, 48]) { 
        cube([20, 21, 34]);
    }
    
    difference() {
        translate([14, -1, 32]) {
            cube([87, 44, 55]);
        }
        translate([-1, 2, 36]) {
            cube([100, 39, 48]);
        }
    }
    
    // Aussparungen für Pinökel am Breadboard
    translate([-1, 4, -3]) { 
        cube([6, 5, 4]);
    }
    translate([-1, 25, -3]) { 
        cube([6, 5, 4]);
    }
    translate([-1, 47, -3]) { 
        cube([6, 5, 4]);
    }
    
    translate([-1, -1, 12]) { 
        cube([6, 4, 5]);
    }
    translate([-1, -1, 66]) { 
        cube([6, 4, 5]);
    }
}