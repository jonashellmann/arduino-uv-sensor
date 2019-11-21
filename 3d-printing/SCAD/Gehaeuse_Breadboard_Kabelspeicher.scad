difference() {
    union() {
        //cube([15, 57, 86]);
        translate([14, 0, 32]) {
            cube([87, 43, 54]);
        }
        
    }
    
    // Aushöhlen des Haupt-Körpers
    translate([-1, 2, 36]) {
        cube([100, 39, 48]);
    }
    
    // Aussparung für Sensorkabel
    translate([25, 20, 82]) {
        cylinder(h=8, r1=4, r2=4, $fn=100);
    }
    translate([0, -2, 39]) { 
        #cube([40, 5, 40]);
    }
    
    // Aussparung fuer Display
    translate([-1, 40, 48]) { 
        cube([20, 18, 34]);
    }
    
    // Einschiebelinie für Kabelkanal
    translate([48, -1, 34]) {
        cube([2, 2, 50]);
    }
}