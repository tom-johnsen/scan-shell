#!/bin/sh

if [ "$#" -eq 0 ] || [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
  echo "Description: Scans the given IP and optional PORT(s)\n"
  echo "Usage: scan IP [PORT]"
  echo "PORT: '-(all)'/'443(single)'/'22-80(range)'/'21,22,53(multiple)'\n"
  echo "Example: 'scan 10.10.10.10' OR 'scan 10.10.10.10 [-/443/22-80/21,22,53]'\n"
  echo "Alias: mkdir -p nmap && nmap -v -sC -sV -oN nmap/[\$1_initial/\$1_ports_\$2] [-p\$2] \$1"
elif [ "$#" -eq 1 ]; then
  mkdir -p nmap
  nmap -v -sC -sV -oN nmap/$1_initial $1
elif [ "$#" -eq 2 ]; then
  mkdir -p nmap
  nmap -v -sC -sV -oN nmap/$1_ports_$2 -p$2 $1
else
  echo "Too many arguments, use -h or --help for help"
fi
