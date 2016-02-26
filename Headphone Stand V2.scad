// Ankur Gupta
// Glabs
// github.com/agupta231
// ankur.gupta-web.com

$fn  = 150;

radius = 25;
width =  165;
screwThickness = 7;
screwPlateLength = 55;
screwPlateWidth = 25;
screwHoleRadius = 3.8;
screwHoleBuffer = 15;
stopperWidth = 10;
stopperLength = 1;
stopperThickness = 2;

union() {
    difference() {
        union() {
            rotate([0, 90, 0]) {
               cylinder(width, radius, radius, center = true);
            }
            translate([-width / 2 + stopperThickness / 2 + 1, 0, (stopperLength + radius) / 2]) {
                cube([stopperThickness, stopperWidth, stopperLength + radius], center = true);
            }
        }
        translate([0, 0, -radius / 2]) {
            cube([width + 5, radius * 2, radius], center = true);
        }
        translate([-width / 2,0,radius - (radius * sqrt(2) / 2)]) {
            rotate([0, -45, 0]) {
                cube([radius,radius * 2,radius * 2], center = true);
            }
        }
    }

    difference() {
        translate([width / 2 + screwPlateLength / 2 - 5, 0, screwThickness / 2]) {
            cube([screwPlateLength + 5, screwPlateWidth, screwThickness], center = true);
        }
        translate([width / 2 + screwPlateLength - screwHoleBuffer,0,screwThickness / 2]) {
            cylinder(screwThickness + 5, screwHoleRadius, screwHoleRadius, center = true);
        }
        translate([width / 2 + screwHoleBuffer,0,screwThickness / 2]) {
            cylinder(screwThickness + 5, screwHoleRadius, screwHoleRadius, center = true);
        }
    }
}
