include <Chamfers-for-OpenSCAD/Chamfer.scad>;
$fn=100;

module stem() {
	translate([0,0,3.5]) {
		difference() {
			union() {
				cube([6,4.4,7],true);
				cylinder(h=7,r=3,center=true);
			}
			cube([4,1.1,8],true);
			cube([1.1,4,8],true);
		}
	}
}

module cap($rad) {
	difference() {
		chamferCylinder(h=7,r=$rad,ch=0,ch2=.8);
		translate([0,0,-2]){
			chamferCylinder(h=7,r=$rad-1.2,ch=0,ch2=.8);
		}
	}
}

//big
union(){
cap($rad=13);
stem();
}

//mid
//union(){
//cap($rad=10);
//stem();
//}