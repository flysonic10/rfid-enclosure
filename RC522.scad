module RFID_RC522() {
	difference(){
		color([0.8, 0, 0]) translate([0,0,0]) cube([60,40,2]); //pcb	
		RFID_Holes();
	}
	color([0.3, 0.3, 0.3]) translate([-11,10,2]) cube([15, 20, 4]); //header
	color([0.8, 0.8, 0.8]) translate([3,35,2]) cube([10, 4, 3]); //resonator
}

module RFID_Holes() {
		translate([52.5,7,0]) cylinder(10.5, 1.5, 1.5, center=true, $fn=100);
		translate([52.5,33,0]) cylinder(10.5, 1.5, 1.5, center=true, $fn=100);
		translate([16,3,0]) cylinder(10.5, 1.5, 1.5, center=true, $fn=100);
		translate([16,37,0]) cylinder(10.5, 1.5, 1.5, center=true, $fn=100);
}