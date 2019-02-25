set ns [new Simulator];#初始化仿真网络实例

set delta  0.1; #[expr [lindex $argv 0]+0.000000001]; #发包间隔
set lastTime  15; #[lindex $argv 1]; #仿真持续时间

set f [open out.tr1 w]
$ns trace-all $f; #记录仿真网络报文发送数据
set nf [open out.nam w]
$ns namtrace-all $nf; #记录仿真网络动画数据

$ns color 0 black
$ns color 1 red
$ns color 2 blue
$ns color 3 green
$ns color 4 purple
$ns color 5 brown
$ns color 6 yellow


Node set multiPath_ 1; #启用多径路由

set NodeNum 16;

for {set i 0} {$i < $NodeNum} {incr i} {
	set n($i) [$ns node]
}

set link_sn [list 0 1 2 3 2 5 4 6 7 8 9 10 11 12 13 14] ; set link_dn [list 1 2 3 4 5 6 7 7 8 9 10 11 12 13 14 15]
set link_bw [list 20 20 15 10 5 10 15 5 20 20 20 20 20 20 20 20] ; set link_dl [list 30 30 20 30 10 5 10 5 30 30 30 30 30 30 30 30]

for {set i 0} {$i < [llength $link_sn]} {incr i} {
	$ns duplex-link $n([lindex $link_sn $i]) $n([lindex $link_dn $i]) [lindex $link_bw $i]Mb [lindex $link_dl $i]ms DropTail
	$ns queue-limit $n([lindex $link_sn $i]) $n([lindex $link_dn $i]) 40
	$ns duplex-link-op $n([lindex $link_sn $i]) $n([lindex $link_dn $i]) orient right
}

$ns rtproto DV; #启用动态路由

#define the tcp connection proc
proc build-tcp { s d BW} {
    global ns f
    set tcp [new Agent/TCP/Newreno]
    $s attach $tcp


    set snk [new Agent/TCPSink/DelAck]
    $ns attach-agent $d $snk

    $tcp set packetSize_ 100
    $tcp set rate_ $BW

    $ns connect $tcp $snk

    set ftp [new Application/FTP]
    $ftp attach-agent $tcp

    #random time to start
    set rng [new RNG]
    $rng seed 0
    set RVstart [new RandomVariable/Uniform]
    $RVstart set min_ 0
    $RVstart set max_ 3.5
    $RVstart use-rng $rng
    $ns at [expr [$RVstart value]]s "$ftp start"
    return $tcp
}

#define the udp connection proc
proc build-udp { s d BW} {
    global ns f
    set udp [new Agent/UDP]
    $s attach $udp

    set null [new Agent/Null]
    $ns attach-agent $d $null

    $ns connect $udp $null

    set par [new Application/Traffic/Pareto]
    $par attach-agent $udp
    $par set rate_ $BW
    $par set packetSize_ 100
    $par set shape_ 1.5


    set rng [new RNG]
    $rng seed 0
    set RVstart [new RandomVariable/Uniform]
    $RVstart set min_ 0
    $RVstart set max_ 3
    $RVstart use-rng $rng

    $ns at [expr [$RVstart value]]s "$par start"
    return $udp
}

#define the probe
proc probe {s d} {
	global ns n lastTime delta #delta_

	
	set udp1 [new Agent/UDP]
	$s attach $udp1 1001; #目的端口号
	$udp1 set fid_ 1; #通信流的流ID
	set poi1 [new Application/Traffic/CBR]; #CBR是常速流, constant bit rate
	$poi1 attach-agent $udp1
	$poi1 set type_ CBR; #设置*.tr文件中报文类别名称
	$poi1 set packetSize_ 46; #pkt的大小
	$poi1 set packetInterval_ $delta
	set null1 [new Agent/Null]
	$ns attach-agent $d $null1
	$ns connect $udp1 $null1


	set udp2 [new Agent/UDP]
	$s attach $udp2 1002; #目的端口号
	$udp2 set fid_ 2; #通信流的流ID
	set poi2 [new Application/Traffic/CBR]
	$poi2 attach-agent $udp2
	$poi2 set type_ CBR; #设置*.tr文件中报文类别名称
	$poi2 set packetSize_ 46
	$poi2 set packetInterval_ $delta
	set null2 [new Agent/Null]
	$ns attach-agent $d $null2
	$ns connect $udp2 $null2


	set udp3 [new Agent/UDP]
	$s attach $udp3 1003; #目的端口号
	$udp3 set fid_ 3; #通信流的流ID
	set poi3 [new Application/Traffic/CBR]; #CBR是常速流, constant bit rate
	$poi3 attach-agent $udp3
	$poi3 set type_ CBR; #设置*.tr文件中报文类别名称
	$poi3 set packetSize_ 46; #pkt的大小
	$poi3 set packetInterval_ $delta
	set null3 [new Agent/Null]
	$ns attach-agent $d $null3
	$ns connect $udp3 $null3


	set udp4 [new Agent/UDP]
	$s attach $udp4 1004; #目的端口号
	$udp4 set fid_ 4; #通信流的流ID
	set poi4 [new Application/Traffic/CBR]
	$poi4 attach-agent $udp4
	$poi4 set type_ CBR; #设置*.tr文件中报文类别名称
	$poi4 set packetSize_ 46
	$poi4 set packetInterval_ $delta
	set null4 [new Agent/Null]
	$ns attach-agent $d $null4
	$ns connect $udp4 $null4


	set udp5 [new Agent/UDP]
	$s attach $udp5 1005; #目的端口号
	$udp5 set fid_ 5; #通信流的流ID
	set poi5 [new Application/Traffic/CBR]
	$poi5 attach-agent $udp5
	$poi5 set type_ CBR; #设置*.tr文件中报文类别名称
	$poi5 set packetSize_ 46
	$poi5 set packetInterval_ $delta
	set null5 [new Agent/Null]
	$ns attach-agent $d $null5
	$ns connect $udp5 $null5


	set udp6 [new Agent/UDP]
	$s attach $udp6 1006; #目的端口号
	$udp6 set fid_ 6; #通信流的流ID
	set poi6 [new Application/Traffic/CBR]
	$poi6 attach-agent $udp6
	$poi6 set type_ CBR; #设置*.tr文件中报文类别名称
	$poi6 set packetSize_ 46
	$poi6 set packetInterval_ $delta
	set null6 [new Agent/Null]
	$ns attach-agent $d $null6
	$ns connect $udp6 $null6


        set rng [new RNG]
        $rng seed 0
        set RVstart [new RandomVariable/Uniform]
        $RVstart set min_ 0
        $RVstart set max_ 2
        $RVstart use-rng $rng
	$ns at [expr [$RVstart value]]s "$poi1 start"
	$ns at [expr [$RVstart value]]s "$poi2 start"
	$ns at [expr [$RVstart value]]s "$poi3 start"
	$ns at [expr [$RVstart value]]s "$poi4 start"
	$ns at [expr [$RVstart value]]s "$poi5 start"
	$ns at [expr [$RVstart value]]s "$poi6 start"

        $ns at 14s "$poi5 stop"
	$ns at 14s "$poi6 stop"
	$ns at 14s "$poi3 stop"
	$ns at 14s "$poi4 stop"
	$ns at 14s "$poi1 stop"
	$ns at 14s "$poi2 stop"

}

#define the finish proc
proc finish { } {
	global argv0
	global ns f nf
	$ns flush-trace
	close $f
	close $nf

	if [string match {*.tcl} $argv0] {
		set prog [string range $argv0 0 [expr [string length $argv0] - 5]]
	} else {
		set prog $argv0
	}

	puts "running nam..."
	exec nam out.nam &
	exit 0
}

#启动仿真
for {set i 0} {$i < [llength $link_sn]} {incr i} {
	for {set j 0} {$j < 3} {incr j} {
		build-tcp $n([lindex $link_sn $i]) $n([lindex $link_dn $i]) 1Mb
	}
	for {set k 0} {$k < 1} {incr k} {
	        build-udp $n([lindex $link_sn $i]) $n([lindex $link_dn $i]) 2Mb
        }
}
#end

for {set j 0} {$j < 24} {incr j} {
	build-tcp $n(2) $n(4) 1Mb  }
for {set j 0} {$j < 8} {incr j} {
	build-udp $n(2) $n(4) 1Mb  }


for {set j 0} {$j < 3} {incr j} {
	build-tcp $n(2) $n(6) 1Mb  }
build-udp $n(2) $n(6) 1Mb

for {set j 0} {$j < 24} {incr j} {
	build-tcp $n(3) $n(7) 1Mb  }
for {set j 0} {$j < 8} {incr j} {
	build-udp $n(3) $n(7) 1Mb  }


for {set j 0} {$j < 3} {incr j} {
	build-tcp $n(5) $n(7) 1Mb  }
build-udp $n(5) $n(7) 1Mb

#启动 probe traffic
probe $n(0) $n(15)

$ns at [expr $lastTime]s "finish"; #在lastTime时刻结束仿真
$ns run
