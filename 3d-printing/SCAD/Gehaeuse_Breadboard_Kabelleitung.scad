difference() {
    union() {
        translate([0, -20, 32]) {
            cube([50, 20, 54]);
        }
        translate([48, -1, 34]) {
            cube([2, 2, 50]);
        }
    }

    translate([-2, -18, 34]) {
        cube([50, 19, 50]);
    }
    
    translate([20, -2, 39]) { 
        cube([20, 5, 40]);
    }
}