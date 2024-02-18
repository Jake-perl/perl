# A hash/associative array is an unordered set of scalars.
# for example, you can make one for abbreviated day names.
my %longday = ("Mon", "Monday", "Tue", "Tuesday", "Wed", "Wednesday", "Thu", "Thursday", "Fri", "Friday", "Sat", "Saturday", "Sun", "Sunday");
# thats too difficult to read. we can make it easier like this
my %longday = (
"Mon" => "Monday",
"Tue" => "Tuesday",
"Wed" => "Wednesday",
"Thu" => "Thursday",
"Fri" => "Friday",
"Sat" => "Saturday",
"Sun" => "Sunday",

# another thing you can do with hashes
my %wife;
%wife{"My father"} = "My mother"
