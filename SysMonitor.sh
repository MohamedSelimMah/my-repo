#!/bin/bash

ascii_art_title() {
    echo "▒███████▒▓█████  ██▀███   ▒█████   ▒█████   ███▄    █ ▓█████ "
    echo "▒ ▒ ▒ ▄▀░▓█   ▀ ▓██ ▒ ██▒▒██▒  ██▒▒██▒  ██▒ ██ ▀█   █ ▓█   ▀ "
    echo "░ ▒ ▄▀▒░ ▒███   ▓██ ░▄█ ▒▒██░  ██▒▒██░  ██▒▓██  ▀█ ██▒▒███   "
    echo "  ▄▀▒   ░▒▓█  ▄ ▒██▀▀█▄  ▒██   ██░▒██   ██░▓██▒  ▐▌██▒▒▓█  ▄ "
    echo "▒███████▒░▒████▒░██▓ ▒██▒░ ████▓▒░░ ████▓▒░▒██░   ▓██░░▒████▒"
    echo "░▒▒ ▓░▒░▒░░ ▒░ ░░ ▒▓ ░▒▓░░ ▒░▒░▒░ ░ ▒░▒░▒░ ░ ▒░   ▒ ▒ ░░ ▒░ ░"
    echo "░░▒ ▒ ░ ▒ ░ ░  ░  ░▒ ░ ▒░  ░ ▒ ▒░   ░ ▒ ▒░ ░ ░░   ░ ▒░ ░ ░  ░"
    echo "░ ░ ░ ░ ░   ░     ░░   ░ ░ ░ ░ ▒  ░ ░ ░ ▒     ░   ░ ░    ░   "
    echo "  ░ ░       ░  ░   ░         ░ ░      ░ ░           ░    ░  ░"
    echo "░                                                             "
    echo ""
}

ascii_art_section() {
    echo "▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒"
    echo "                       $1"
    echo "▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒"
    echo ""
}

cpu_usage() {
    ascii_art_section "CPU Usage"
    top -bn1 | grep "Cpu(s)" | awk '{printf "CPU Usage: %.2f%%\n", 100 - $8}'
    echo ""
}

memory_usage() {
    ascii_art_section "Memory Usage"
    free -h | awk '/^Mem/ {printf "Used: %s / Total: %s (%.2f%% used)\n", $3, $2, ($3/$2)*100}'
    echo ""
}

disk_usage() {
    ascii_art_section "Disk Usage"
    df -h --output=source,size,used,avail,pcent | column -t
    echo ""
}

network_stats() {
    ascii_art_section "Network Statistics"
    ip -s link | awk '/^[0-9]+:/ {iface=$2} /RX:/ {getline; rx=$1} /TX:/ {getline; tx=$1; printf "%s RX: %s bytes, TX: %s bytes\n", iface, rx, tx}'
    echo ""
}

system_uptime() {
    ascii_art_section "System Uptime"
    uptime -p
    echo ""
}

top_processes() {
    ascii_art_section "Top 5 Processes by CPU Usage"
    ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6 | column -t
    echo ""
}

kill_process() {
    ascii_art_section "Kill a Process"
    ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6 | column -t
    read -p "Enter PID to kill (or type 'exit' to skip): " pid
    [[ $pid =~ ^[0-9]+$ ]] && kill -9 "$pid" && echo "Process $pid terminated." || echo "Invalid input or skipped."
    echo ""
}

clear
ascii_art_title
echo "          Welcome to the System Resource Monitor"
echo ""

cpu_usage
memory_usage
disk_usage
network_stats
system_uptime
top_processes
kill_process

ascii_art_title
echo "              End of System Resource Monitor"
echo ""

