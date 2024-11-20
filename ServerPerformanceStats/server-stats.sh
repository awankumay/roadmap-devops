#!/bin/bash
# Created By Andika - 2024


echo "######################"
echo "# System Uptime Info #"
echo "######################"

uptime

# Total CPU usage

cpu_usage_stats() {
    echo "###################"
    echo "# Total CPU Usage #"
    echo "###################"
    top -bn1 | grep "%Cpu(s):" | cut -d ',' -f 4 | awk '{print "Usage: " 100-$1 "%"}'
}

# Total memory usage (Free vs Used including percentage)

memory_usage_stats() {
    echo "######################"
    echo "# Total Memory Usage #"
    echo "######################"
}

# Total disk usage (Free vs Used including percentage)

disk_usage_stats() {
    echo "######################"
    echo "# Total Memory Usage #"
    echo "######################"
}

# Top 5 processes by CPU usage

top_5_cpu_usage() {
    echo "#############"
    echo "# Top 5 CPU #"
    echo "#############"
}

# Top 5 processes by memory usage

top_5_memory_usage() {
    echo "################"
    echo "# Top 5 Memory #"
    echo "################"
}

cpu_usage_stats
memory_usage_stats
disk_usage_stats
top_5_cpu_usage
top_5_memory_usage