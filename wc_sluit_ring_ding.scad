// Maten zijn in tienden van millimeters

$fa = 1;
$fs = 0.4;



// Buiten diameter onderschijf
A = 475;

// Onderschijf, binnenring (grootste diameter)
B = 231;

// Hoogte onderschijf
C = 11;

// Innerring hoogte.
F = 20;

// Buiten maat top
D = 255;

// Midden gat/buis (smalste diameter)
E = 222;


K = 221;

// Top hoogte, start positie boven onderschijf
HEIGHT = 71;
Y = HEIGHT - C;


h2 = 0;


BONUS_STRENGTH = 80;
TIGHTENING_RING_THICKNESS = 5;





difference() {
    union() {
        
        
        // Reenforcement
        color([0.5,0.6,0.4]) // greenish
        difference() {
            translate([0, 0, C])
                cylinder(h=Y, 
                         r1=D + 30 + BONUS_STRENGTH, 
                         r2=D + 30);

            translate([0, 0, C - 0.01])
                cylinder(h = Y + 0.02, r = D + 30);
        }

        color([1.0,0.8,1.0]) // pink
        difference() {

            translate([0, 0, C])
                cylinder(h = Y, r = D + 30);

            translate([0, 0, C - 0.01])
                cylinder(h = Y + 0.02, r = D);
        }
        
        
        
        // Tightening chorus ring
        wheel_radius = 244;
        tyre_diameter = 24;
        
        color([1.0,1.0,0.0]) // yellow
        translate([0, 0, HEIGHT - 30]) 
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

