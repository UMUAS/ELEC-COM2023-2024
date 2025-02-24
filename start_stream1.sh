#!/bin/bash

# Ask the user to specify the interface
read -p "Enter the wireless interface (default: wlan0): " IFACE
IFACE=${IFACE:-wlan0}  # Use wlan0 if the user enters nothing

# Check if the specified interface exists
if ! ip link show "$IFACE" > /dev/null 2>&1; then
    echo "Error: Interface $IFACE not found. Exiting..."
    exit 1
fi

# Start WiFi hotspot
echo "Starting WiFi hotspot on $IFACE..."
sudo nmcli d wifi hotspot ifname "$IFACE" ssid umuas_hotspot password "umuas1920" band a channel 36

# Set transmit power
echo "Setting TX power for $IFACE..."
sudo iw dev "$IFACE" set txpower fixed 3000

# Show wireless and network interfaces info
echo "Displaying wireless and network interface details..."
iwconfig "$IFACE"
ifconfig "$IFACE"

# Run Python script
echo "Starting Python script..."
python3 ~/umuas/socket_stream.py
