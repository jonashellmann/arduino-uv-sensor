difference() {
    cube([20, 63, 86]);
    
    // Aushöhlen des Hauptkörpers
    translate([2, 2, 2]) {
        cube([19, 59, 82]);
    }
    translate([-28, 2, 37]) {
        cube([31, 55, 47]);
    }
    
    // Aussparung für Batterie
    translate([2, 8, -2]) { 
        cube([10, 10, 6]);
    }  
    
    // Aussparung für USB-Anschluss
    translate([2, 36, -2]) { 
        cube([11, 13, 6]);
    } 
    
    // Anbindungslinie für Batteriefach
    //translate([-1, 2, 5]) {
    //    cube([2, 44, 2]);
    //}
    
    // Anbindungslinie für Kabelkanal
    translate([2, -1, 35]) {
        cube([18, 2, 3]);
    }
    
    // Anbindungslinie für Kabelspeicher
    translate([-1, 1, 35]) {
        cube([2, 55, 3]);
    }
}