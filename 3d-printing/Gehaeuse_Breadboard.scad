difference() {
    union() {
        cube([15, 57, 86]);
        
        // Ausbeulungen für Kabel
        translate([0, 0, 32]) {
            cube([102, 42, 54]);
        }
        translate([0, -20, 32]) {
            cube([50, 20, 54]);
        }
    }
    
    // Aushöhlen der Rechtecke
    translate([-1, 2, 2]) {
        cube([10, 53, 82]);
    }
    translate([-1, 2, 36]) {
        cube([100, 39, 48]);
    }
    translate([-2, -18, 34]) {
        cube([50, 18, 50]);
    }
    
    // Aussparung für Sensorkabel
    translate([15, 20, 82]) {
        rotate([0, 0, 0]) {
            cylinder(h=8, r1=3, r2=3, $fn=100); 
        }
    }
    translate([20, -2, 39]) { 
        cube([20, 5, 40]);
    }
    
    // Aussparung fuer Display
    translate([-1, 40, 48]) { 
        cube([20, 18, 34]);
    }
}