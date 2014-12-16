include <RC522.scad>;
include <nutsnbolts/cyl_head_bolt.scad>;
include <nutsnbolts/materials.scad>;

//RFID Reader
translate([-40,20,0.8]) rotate([0,0,270]) RFID_RC522();

//SparkCore
color("white") translate([17,-18,-4]) rotate([90, 0, 0]) import("/Users/william/Documents/3D Projects/RFID Housing/SparkCore.stl");

plate();
box();


//Main Acrylic Plate
module plate(){
	difference(){
		color([1, .8, 1, .3]) cube([105, 85, 1.6], true);
		translate([-40,20,0.8]) rotate([0,0,270]) Screw_Holes();
		translate([-20, 43, 0]) sphere(10); //RFID wire cutout
	}
	translate([-40,20,2.8]) rotate([0,0,270]) Screws();
	translate([-40,20,-.9]) rotate([0,0,270]) Nuts();
}

//Main Enclosure
module box(){
	//Main
	difference(){
		color([0,0.5,0.8]) translate([0,0,-13.4]) cube([110, 90, 25], true);
		translate([0,0,-7.5]) cube([100, 80, 50], true);	
	}

	//Lip
	difference(){
		color([0,0.5,0.8]) translate([0,0,-0.1]) cube([110, 90, 1.6], true);
		translate([0,0,0]) cube([105, 85, 25], true);
	}
}

//Screw Holes in Acrylic
module Screw_Holes(){
	translate([52.5,7,0]) cylinder(10.5, 2.5, 2.5, center=true, $fn=100);
	translate([52.5,33,0]) cylinder(10.5, 2.5, 2.5, center=true, $fn=100);
	translate([16,3,0]) cylinder(10.5, 2.5, 2.5, center=true, $fn=100);
	translate([16,37,0]) cylinder(10.5, 2.5, 2.5, center=true, $fn=100);
}

module Screws(){
	translate([52.5,7,0]) stainless() screw("M3x5", thread="modeled");
	translate([52.5,33,0]) stainless() screw("M3x5", thread="modeled");
	translate([16,3,0]) stainless() screw("M3x5", thread="modeled");
	translate([16,37,0]) stainless() screw("M3x5", thread="modeled");
}

module Nuts(){
	translate([52.5,7,0]) stainless() nut("M3", thread="modeled");
	translate([52.5,33,0]) stainless() nut("M3", thread="modeled");
	translate([16,3,0]) stainless() nut("M3", thread="modeled");
	translate([16,37,0]) stainless() nut("M3", thread="modeled");
}
