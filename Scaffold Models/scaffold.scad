


d1 = 3;
d2 = d1*20; 

fn = 20;

i = 12;
j = 2*i;
multiplier = 3;

shift_x = d1*multiplier;
shift_z = d1;
h1 = j*d1*2;

width_x = shift_x*i;


module lattice(c1){
   translate([-width_x/2,0,-h1/2])
   for ( jj = [1:1:j]){     
   for ( ii = [1:1:i]){
   color(c1, .5)
   translate([ii*shift_x, 2*jj*shift_z, 0])
   rotate([0, 0, 0]) 
   cylinder(h=h1, d=d1, $fn=fn);
    }}}
    
module lattice_with_hole(){
    difference(){
        
    union(){ 
    rotate([90,0,0]) lattice("red");
    translate([0,0,d1]) rotate([90,0,90]) lattice("red");
    //translate([d1,0,h1/2]) bioprint("green");
    //translate([0,d1,d1+h1/2]) rotate([0,0,90]) bioprint("green"); 
        }
    
   cylinder(h=3*h1, d=d2, $fn=fn);
    }}
    
module hollow_tube(){
    difference(){
    cylinder(h=2*h1, d=3*shift_x*i, $fn=fn);
    cylinder(h=2*h1, d=1*shift_x*i, $fn=fn);
    }}

module fdm_lattice(){
    difference(){
        lattice_with_hole();
        hollow_tube();
        }}

module bioprint(c1){
    translate([-width_x/2,0,-h1/2])
    for ( jj = [1:1:j]){     
    for ( ii = [1:1:i]){
        translate([ii*shift_x, 0, 2*jj*shift_z])
        color(c1, 0.15)
        cube([shift_x*0.90-d1,h1,d1], true);
    }}}
    
module bioprint_lattice(){
    translate([0,0,h1/2]) bioprint("green");
    translate([0,0,d1+h1/2]) rotate([0,0,90]) bioprint("yellow");
    }

module lattice_combined(){
    union(){
    rotate([90,0,0]) lattice("red");
    translate([0,0,d1]) rotate([90,0,90]) lattice("blue");
    
    translate([0,0,h1/2]) bioprint("green");
    translate([0,0,d1+h1/2]) rotate([0,0,90]) bioprint("yellow"); 
    }}

fdm_lattice();
       
  
