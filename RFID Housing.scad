include <RC522.scad>;
include <nutsnbolts/cyl_head_bolt.scad>;
include <nutsnbolts/materials.scad>;


//SparkCore
color("white") translate([17,-18,-7]) rotate([90, 0, 0]) import("/Users/william/Documents/3D Projects/RFID Housing/SparkCore.stl");

Clips();
RFID();
Plate();
Box();




//Main Acrylic Plate
module Plate(){
	difference(){
		color([1, .8, 1, .3]) cube([105, 85, 1.6], true);
		translate([-40,20,0.8]) rotate([0,0,270]) Screw_Holes();
		Clip_Holes();
		translate([-20, 43, 0]) sphere(10); //RFID wire cutout
		translate([-20,17.5,-0.8]) cube([25, 3, 5], true); //Header solder cutout
		translate([-3,15,-0.8]) cube([3, 8, 5], true); //Solder cutout
	}
}

//Main Enclosure
module Box(){
	//Main
	difference(){
		color([0,0.5,0.8]) translate([0,0,-15.9]) cube([110, 90, 30], true);
		translate([0,0,-7.5]) cube([100, 80, 50], true);	
	}

	//Lip
	difference(){
		color([0,0.5,0.8]) translate([0,0,-0.1]) cube([110, 90, 1.6], true);
		translate([0,0,0]) cube([105, 85, 25], true);
	}
	Feet();
}

//Screw Holes in Acrylic
module Screw_Holes(){
	translate([52.5,7,0]) cylinder(10.5, 2.25, 2.25, center=true, $fn=100);
	translate([52.5,33,0]) cylinder(10.5, 2.25, 2.25, center=true, $fn=100);
	translate([16,3,0]) cylinder(10.5, 2.25, 2.25, center=true, $fn=100);
	translate([16,37,0]) cylinder(10.5, 2.25, 2.25, center=true, $fn=100);
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

module foot(){
	difference(){
		color([0,0.5,0.8]) cylinder(2, 10, 10, center=true, $fn=100);
		cylinder(10.5, 2.5, 2.5, center=true, $fn=100);
	}
	stainless() screw("M5x10", thread="modeled");
}

module Feet(){
	translate([-44, 34, -29.9]) foot();
	translate([44, -34, -29.9]) foot();
	translate([-44, -34, -29.9]) foot();
	translate([44, 34, -29.9]) foot();
}

//RFID Reader
module RFID(){
	translate([-40,20,0.8]) rotate([0,0,270]) RFID_RC522();
	translate([-40,20,2.8]) rotate([0,0,270]) Screws();
	translate([-40,20,-.9]) rotate([0,0,270]) Nuts();
}

//Clips to hold up the Spark Core
module Clips(){
	translate([27, -22, -1.3]) clip();
	translate([12.9, 16, -1.3]) rotate([0,0,-90]) clip();
	translate([41.25, 16, -1.3]) rotate([0,0,90]) clip();
}

module clip(){
	difference(){
		color([0,0.5,0.8]) cylinder(1, 5, 5, center=true, $fn=100);
		cylinder(10.5, 1.5, 1.5, center=true, $fn=100);
	}
	color([0,0.5,0.8]) translate([0,3.5,-4]) cube([3,1,8], true);
	color([0,0.5,0.8]) translate([0,3.9,-6.8]) rotate([40,0,0]) cube([3,1,1.5], true);
	translate([0,0,2])stainless() screw("M3x5", thread="modeled");
	translate([0,0,-1]) stainless() nut("M3", thread="modeled");
}

module Clip_Holes(){
	translate([27, -22, -1.3]) cylinder(10.5, 2.25, 2.25, center=true, $fn=100);
	translate([12.9, 16, -1.3]) cylinder(10.5, 2.25, 2.25, center=true, $fn=100);
	translate([41.25, 16, -1.3]) cylinder(10.5, 2.25, 2.25, center=true, $fn=100);
}
