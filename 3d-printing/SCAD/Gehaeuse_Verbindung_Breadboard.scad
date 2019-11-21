difference() {
    union() {
        translate([-20, 0, 0]) { 
            cube([3, 57, 86]);
        }
        translate([-20, -20, 32]) {
            cube([3, 20, 54]);
        }
    }
    
    // Loch für Kabel
    translate([-65, -16, 36]) {
        cube([50, 16, 46]);
    }
    
    // Einlassungen zum Kleben
    translate([-25, 15, 76]) {
        cube([6, 10, 11]);
    }
    translate([-25, 15, 38]) {
        cube([6, 10, 10]);
    }
    translate([-25, 15, -1]) {
        cube([6, 10, 11]);
    }
}