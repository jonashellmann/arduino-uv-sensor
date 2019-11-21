difference() {
    union() {
        translate([-25, 15, 77]) {
            cube([6, 9, 9]);
        }
        translate([-25, 15, 39]) {
            cube([6, 9, 9]);
        }
        translate([-25, 15, 0]) {
            cube([6, 9, 9]);
        }
        
        translate([-28, 0, 0]) { 
            cube([3, 62, 86]);
        }
        translate([-28, -20, 32]) {
            cube([3, 20, 54]);
        }
    }
    
    translate([-65, -16, 36]) {
        cube([50, 16, 46]);
    }
    
    for (a = [10 : 17 : 45]) {
        for (b = [10 : 19 : 85]) {
            translate([-30, 0 + a, 0 + b]) {
                cube([6, 10, 10]);
            }
        }
    }
}