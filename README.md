# Server Performance Monitor
 
A simple Bash script that prints basic system performance stats: CPU usage, memory usage, disk usage, and the top processes consuming resources.
 
## Features
 
* CPU usage (based on `top`)
* Memory usage with percentages
* Disk usage for the root filesystem
* Top 5 processes by CPU
* Top 5 processes by memory
## Usage
 
Make the script executable:
 
```bash
chmod +x monitor.sh
```
 
Run it:
 
```bash
./monitor.sh
```
 
## Requirements
 
The script uses standard Linux tools: `top`, `free`, `df`, `ps`, `awk`, `bc`
 
## Notes
 
* Update the disk device in `df` if your system uses a different root partition.
* Works on most Linux distributions without extra setup.

## Project URL
https://github.com/am15226-glitch/Server-Performance-Bash

