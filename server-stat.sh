#!/bin/bash

# Cpu Usage
get_cpu_usage() {
    cpu_used=$(top -bn1 | grep "Cpu" | awk '{print 100 - $8}')

    echo "--- Cpu Usage ---"
    echo "TOTAL CPU USED: $cpu_used%"
    echo
}

#Memory usage
get_memory_usage() {
    total_mem=$(free -m | grep "Mem:" | awk '{print $2}')
    used_mem=$(free -m | grep "Mem:" | awk '{print $3}')
    free_mem=$(free -m | grep "Mem:" | awk '{print $4}')

    used_percent=$(echo "scale=2; ($used_mem / $total_mem) * 100" | bc)
    free_percent=$(echo "scale=2; ($free_mem / $total_mem) * 100" | bc)

    echo "--- MEMORY USAGE ---"
    echo "Total Memory: $total_mem MB"
    echo "Used Memory: $used_mem MB ($used_percent%)"
    echo "Free Memory: $free_mem MB ($free_percent%)"
    echo
}

#Disk Usage
get_disk_usage() {
    total=$(df -h / | grep "/dev/sdd" | awk {'print $2'})
    used=$(df -h / | grep "/dev/sdd" | awk {'print $3'})
    free=$(df -h / | grep "/dev/sdd" | awk {'print $4'})

    used_per=$(echo "scale=2; ($used / $total) * 100" | bc)
    free_per=$(echo "scale=2; ($free / $total) * 100" | bc)

    echo "--- DISK USAGE ---"
    echo "Total Disk Space: $total"
    echo "Used Disk Space: $used ($used_per%)"
    echo "Free Disk Space: $free ($free_per%)"
    echo
}

# Top 5 processes by CPU usage
top_cpu_processes() {
    echo "--- TOP 5 PROCESSES BY CPU USAGE ---"
    ps aux --sort=-%cpu| awk '{
    for(i=1;i<=4;i++)
        printf "%-10s", $i

    printf "%-10s %-10s\n", $8, $9
    }' | head -n 6
    echo
}

top_memory_processes() {
    echo "--- TOP 5 PROCESSES BY MEMORY USAGE ---"
    ps aux --sort=-%mem| awk '{
    for(i=1;i<=4;i++)
        printf "%-10s", $i

    printf "%-10s %-10s\n", $8, $9
    }' | head -n 6
    echo
}
# RUN EVERYTHING
get_cpu_usage
get_memory_usage
get_disk_usage
top_cpu_processes
top_memory_processes