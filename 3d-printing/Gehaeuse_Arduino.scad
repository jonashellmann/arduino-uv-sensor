difference() {
    union() {
        // Hauptkörper
        cube([20, 57, 86]);
        translate([-30, 0, 35]) {
            cube([30, 57, 51]);
        }
        
        // Ausbeulung für Kabel
        translate([-30, -20, 35]) {
            cube([50, 20, 51]);
        }
        
        // Ausbeulung für Batterie
        translate([-21, 0, 5]) {
            cube([21, 48, 30]);
        }
    }
    
    // Aushöhlen des Hauptkörpers
    translate([2, 2, 2]) {
        cube([19, 53, 82]);
    }
    translate([-28, 2, 37]) {
        cube([31, 53, 47]);
    }
    translate([-28, -18, 37]) {
        cube([49, 18, 47]);
    }
    translate([-19, -1, 7]) {
        cube([17, 46, 27]);
    }
    
    // Aussparung für Sensorkabel
    translate([-20, -2, 41]) { 
        cube([20, 5, 40]);
    } 
    
    // Aussparung für Batterie
    translate([2, 8, -2]) { 
        cube([10, 10, 6]);
    }  
    
    // Aussparung für USB-Anschluss
    translate([2, 32, -2]) { 
        cube([11, 13, 6]);
    } 
}