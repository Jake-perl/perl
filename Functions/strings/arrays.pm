# an array is a list of scalars
my @house = ("bedroom", "lounge", "kitchen", "etc");
# you can format it differently.
my ("bed","desk", "cupboard", "etc") = @room;
# another way
my @house;
$house[0] = "bedroom";
$house[1] = "lounge";
$house[2] = "kitchen";
$house[3] = "etc";

# list assignments
my ($x, $y, $z) = (10, 20, 30);
# or
my ($x, $y, $z) = ($z, $y, $x);
