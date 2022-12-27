// Maten zijn in tienden van millimeters

$fa = 1;
$fs = 0.4;



// Buiten diameter onderschijf
A = 47.5;

// Onderschijf, binnenring (grootste diameter)
B = 23.1;

// Hoogte onderschijf
C = 1.1;

// Innerring hoogte.
F = 2.0;

// Buiten maat top
D = 25.5;

// Midden gat/buis (smalste diameter)
E = 22.2;


K = 22.1;

// Top hoogte, start positie boven onderschijf
HEIGHT = 7.1;
Y = HEIGHT - C;


h2 = 0;


BONUS_STRENGTH = 8.0;
TIGHTENING_RING_THICKNESS = 0.5;

// Tightening chorus ring
wheel_radius = 24.4;
tyre_diameter = 2.4;



difference() {
    union() {
        
        
        // Reenforcement
        color([0.5,0.6,0.4]) // greenish
        difference() {
            translate([0, 0, C])
                cylinder(h=Y, 
                         r1=D + 3.0 + BONUS_STRENGTH, 
                         r2=D + 3.0);

            translate([0, 0, C - 0.01])
                cylinder(h = Y + 0.02, r = D + 3.0);
        }

        color([1.0,0.8,1.0]) // pink
        difference() {

            translate([0, 0, C])
                cylinder(h = Y, r = D + 3.0);

            translate([0, 0, C - 0.01])
                cylinder(h = Y + 0.02, r = D);
        }
        
        
        
        // Tightening chorus ring       
        color([1.0,1.0,0.0]) // yellow
        translate([0, 0, HEIGHT - 3.0]) 
        rotate_extrude(angle=360) {
            translate([wheel_radius - tyre_diameter/2, 0])
                circle(d=tyre_diameter);
        }
        
/*
        // Tightening Ring
        color([1.0,1.0,0.0]) // yellow
        difference() {
            translate([0, 0, HEIGHT - 30 + h2])
                cylinder(h = 10, r = E);

            translate([0, 0, HEIGHT - 30 - 0.01 + h2])
                cylinder(h = 10 + 0.02, 
                         r = E - TIGHTENING_RING_THICKNESS);
        }
*/        
        
        // top
        color([0.0,0.0,1.0]) // blue
        difference() {
            translate([0, 0, C])
                cylinder(h = Y, r = D);

            translate([0, 0, C - 0.01])
                cylinder(h = Y + 0.02, r = E);
        }

        
        
        // Onderschijf
        color([1.0,0.0,0.0])
        difference() {
            // Outer size
            cylinder(h = C, r = A);
        
            // Outerring, binnenkant
            translate([0, 0, -0.01])
                cylinder(h = F + 0.02, r = B);
        }
    };
    
    color([0.0,1.0,0.0])
    translate([0, 0, -0.01])
    cylinder(h = F, r = B);
}

