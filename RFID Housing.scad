include <RC522.scad>;


//Main Plate
difference(){
	color("black") cube([105, 105, 1.6], true);

	translate([-20, 0, 0]) cube([40.5, 61.75, 5], true); //RFID cutout
	translate([27, 0, 0]) cube([21, 37.5, 5], true); //SparkCore cutout
	translate([-20, 53, 0]) sphere(10); //RFID wire cutout
	translate([27, 0, -0.8]) cube([23, 39.5, 1.6], true); //Plexiglass cutout
}

//Support for RFID reader
color("gray") translate([-20,0,-0.8]) cube([50, 64, 0.8], true);


//RFID Reader
translate([-40,30,-0.8]) 	rotate([0,0,270]) RFID_RC522();

//SparkCore
color("white") translate([17,-18,-4]) rotate([90, 0, 0]) import("/Users/william/Documents/3D Projects/RFID Housing/SparkCore.stl");
