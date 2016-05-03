module volcano () {
    color("MediumSpringGreen")
        union(){
            scale([1.5, 1.5, 2])
                import("Vesuvius.STL", convexity = 5);
            translate([4, -5, 0])
                cylinder(40, 40);
        }
}

module mex_train() {
    translate([0, 15, 0])
        import("Mexican_Train_Base.stl", convexity = 5);
}

module label() {
    linear_extrude(height = 2){
        text("Mount", font="URW Bookman L:style=Bold", halign="center");
        translate([0, -12, 0])
            text("ChooChooVius", font="URW Bookman L:style=Bold", halign="center");
    }
}

module domino(){
    scale([6, 6, ,6])
        translate([-5, -2.5, 0])
            cube([10, 5, 20]);
}

difference() {
    mex_train();
    mirror([0,1,0])
        translate([0, 0, -1])
            label();
}
translate([0, -3, 12]) {
    difference() {
        rotate([0, 0, 25])
            volcano();
        rotate([0, 0, -90])
            translate([0, 0, 25])
                domino();
    }
}
