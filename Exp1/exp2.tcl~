set ns [new Simulator]

set tr [open exp2.tr w]
$ns trace-all $tr

set namtr [open exp2.nam w]
$ns namtrace-all $namtr

set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]
set n4 [$ns node]
set n5 [$ns node] 

$ns duplex-link $n0 $n1 10Mb 5ms DropTail
$ns duplex-link $n2 $n0 10Mb 5ms DropTail
$ns duplex-link $n3 $n0 10Mb 5ms DropTail
$ns duplex-link $n4 $n1 10Mb 5ms DropTail
$ns duplex-link $n5 $n1 10Mb 5ms DropTail

$ns duplex-link-op $n0 $n1 orient right
$ns duplex-link-op $n0 $n2 orient left-up
$ns duplex-link-op $n0 $n3 orient left-down
$ns duplex-link-op $n1 $n4 orient right-up
$ns duplex-link-op $n1 $n5 orient right-down


#Setting the UDP
set udp0 [new Agent/UDP]
$ns attach-agent $n3 $udp0

set null0 [new Agent/Null]
$ns attach-agent $n5 $null0

$ns connect $udp0 $null0

#Attaching CBR to UDP
set cbr0 [new Application/Traffic/CBR]
$cbr0 attach-agent $udp0
$cbr0 set packetSize_ 2048
$cbr0 set rate_ 1.5Mb

$ns at 1.0 "$cbr0 start"

$ns at 5.0 "$cbr0 stop"

#Setting TCP Path between 2 and 4
set tcp0 [new Agent/TCP]
$ns attach-agent $n2 $tcp0
$tcp0 set packetSize_ 1024
$tcp0 set rate_ 0.5Mb

set sink0 [new Agent/TCPSink]
$ns attach-agent $n4 $sink0

$ns connect $tcp0 $sink0
set ftp0 [new Application/FTP]
$ftp0 attach-agent $tcp0
$ftp0 set packetSize_ 2048
$ftp0 set rate_ 0.5Mb

$ns at 2.0 "$ftp0 start"
$ns at 5.0 "$ftp0 stop"


$ns at 50.0 "$ns halt"
$ns run

