#!/bin/bash

cpu_usage() {
    echo "=== CPU Usage ==="
    top -bn1 | grep "Cpu(s)" | awk '{print "CPU Usage: " 100 - $8 "%"}'
    echo ""
}


memory_usage(){
	echo "=== Memory Usage ==="
	free -h | awk '/^Mem/ {print "Used: " $3 " / Total: " $2}'
	echo ""
}

disk_usage(){
	echo "=== Disk Usage ==="
	df -h --output=source,pcent | tail -n +2
	echo ""
}

network_stats(){
	echo "=== Network Statistics ==="
	ip -s link | awk '/^[0-9]+:/ {iface=$2 } /RX:/ { getline; rx=$1 } /TX:/ {getline; tx=$1; print iface " RX: " rx "bytes, TX: " tx " bytes" }'
	echo ""
}

echo" === System Resource Monitor ==="
echo" Date & Time: $(date)"
echo ""
cpu_usage
memory_usage
disk_usage
network_stats
