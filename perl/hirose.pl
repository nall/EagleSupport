#!/usr/bin/perl

print <<EOF;
open stuntaz.lbr;
edit HIROSE-FX2-100S.pac;
set grid mm 0.01 on;

layer top;

EOF

$y = 6.5;
$x = 5.66;

@names = ("B", "B", "A", "A");
@numbers = (49, 50, 49, 50);
@starts = (5.66 + 1.27, 5.66, 5.66 + 1.27, 5.66);
for($j = 0; $j < 4; ++$j)
{
    $x = $starts[$j];
    for($i = 0; $i < 25; ++$i)
    {
        $number = $numbers[$j] - ($i * 2);
        $type = "round";
        if($number == 1)
        {
            $type = "square";
        }
        $pin = $names[$j].$number;
        print "PAD $type '$pin' ($x $y);\n";
        
        $x += 2.54;
    }
    
    $y -= 1.905;
}
