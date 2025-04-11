#!/usr/bin/tclsh

proc power_func {a b} {
  set res 1
  for {set i 0} { $i < $b } {incr i} {
    puts "#($i/$b) res = $res"
    set res [ expr { $res * $a} ]
  }
  return $res
  #return expr {pow($a, $b)}
}

set a 2
set b 8
set result [ power_func 2 8 ]

puts $result

puts "power($a, $b) = {$result}"
