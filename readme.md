# Scan shell script

`scan` is a shell script designed to simplify scanning tasks using `nmap`. It provides a convenient shortcut for running common `nmap` commands with predefined options.

## Usage

```shell
scan IP [PORT]
```

- `IP`: The IP address to scan.
- `PORT` (optional): The port(s) to scan. It can be specified as a single port, a range of ports, or a comma-separated list of ports. Use `-` to scan all ports.
- You can not specify additional arguments for nmap using this script, use `nmap` directly for that, this is meant to speed up initial scans.

Examples:

- `scan 10.10.10.10`: Scans the IP address `10.10.10.10` using nmap's top 1000 ports.
- `scan 10.10.10.10 -`: Scans all 65535 ports.
- `scan 10.10.10.10 80`: Scans port `80`.
- `scan 10.10.10.10 80-443`: Scans ports `80` to `443`.
- `scan 10.10.10.10 22,80,443`: Scans ports `22`, `80` and `443`.

## Features

- **Quick Scanning**: Easily perform default scans on specified IP addresses and optional ports.
- **Automatic Directory Creation**: The script creates a directory named `nmap` if it doesn't already exist, ensuring that scan results are stored in an organized manner.
- **Flexible Port Specification**: Specify individual ports, port ranges, or a combination of both using comma-separated values. Use `-` to scan all ports.

## Log Files

The `scan` script automatically creates log files for each scan performed. The log files are stored in the `nmap` directory, and the naming syntax for the log files is as follows:

- For scans with only the IP specified: `IP_initial`
- For scans with both IP and port(s) specified: `IP_ports_PORT`

Examples:

- `scan 10.10.10.10`: nmap/10.10.10.10_initial
- `scan 10.10.10.10 -`: nmap/10.10.10.10_-
- `scan 10.10.10.10 80`: nmap/10.10.10.10_80
- `scan 10.10.10.10 80-443`: nmap/10.10.10.10_80-443
- `scan 10.10.10.10 22,80,443`: nmap/10.10.10.10_22,80,443

## Options

- `-h`, `--help`: Displays a help message with usage instructions and examples.

## Requirements

- `nmap` must be installed on the system and accessible in your `$PATH` for the script to function properly.

## Installation

### Directly into a `$PATH` location

1. `git clone` or download/copy the script and save it as `scan.sh`.
2. Copy the `scan.sh` script to a directory included in your `$PATH`, such as `/usr/local/bin`.
3. Make the script executable using the command `chmod +x scan.sh`.
4. Rename the `scan.sh` file to `scan`.

### Via a symlink

1. `git clone` or download/copy the script and save it as `scan.sh` in your preferred location.
2. Make the script executable using the command `chmod +x scan.sh`.
3. Run `ln -s /path/to/scan.sh /path/to/$PATH/scan`.

## License

This project is licensed under the [MIT License](LICENSE).
