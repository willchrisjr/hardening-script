#!/bin/bash

# Demo script to simulate running the hardening script and capture output
# This creates a realistic simulation of what happens when the script runs
# without actually making system changes

OUTPUT_FILE="hardening_demo_output.txt"

# Function to simulate command output with timestamp
simulate_output() {
    echo "$1" | tee -a "$OUTPUT_FILE"
    sleep 0.2
}

# Clear any existing output file
rm -f "$OUTPUT_FILE"

# Start the simulation
simulate_output "\n=============================================="
simulate_output "RHEL System Hardening Script - Demo Run"
simulate_output "==============================================\n"
simulate_output "Starting system hardening process..."
simulate_output "[$(date)] Hardening process started"

# Simulate system updates
simulate_output "\nChecking for system updates..."
simulate_output "System updated successfully"
simulate_output "[$(date)] System updated successfully"

# Simulate disabling services
simulate_output "\nDisabling unused services..."
SERVICES=("bluetooth" "telnet" "cups" "avahi-daemon" "rpcbind" "nfs" "autofs")
for service in "${SERVICES[@]}"; do
    simulate_output "Disabled $service service"
    simulate_output "[$(date)] Disabled $service service"
done

# Simulate firewall configuration
simulate_output "\nConfiguring firewall..."
simulate_output "Started and enabled firewalld"
simulate_output "[$(date)] Started and enabled firewalld"
simulate_output "Firewall configured successfully"
simulate_output "[$(date)] Firewall configured successfully"

# Simulate securing critical files
simulate_output "\nSecuring critical system files..."
simulate_output "Secured /etc/shadow (600)"
simulate_output "[$(date)] Secured /etc/shadow (600)"
simulate_output "Secured /etc/passwd (644)"
simulate_output "[$(date)] Secured /etc/passwd (644)"
simulate_output "Secured /etc/group (644)"
simulate_output "[$(date)] Secured /etc/group (644)"

# Simulate SSH hardening
simulate_output "\nCreated backup of /etc/ssh/sshd_config"
simulate_output "[$(date)] Created backup of /etc/ssh/sshd_config"
simulate_output "Secured /etc/ssh/sshd_config (600)"
simulate_output "[$(date)] Secured /etc/ssh/sshd_config (600)"
simulate_output "Hardening SSH configuration..."
simulate_output "SSH configuration hardened and service restarted"
simulate_output "[$(date)] SSH configuration hardened and service restarted"

# Simulate password policy configuration
simulate_output "\nConfiguring password policies..."
simulate_output "Created backup of /etc/pam.d/system-auth"
simulate_output "[$(date)] Created backup of /etc/pam.d/system-auth"
simulate_output "Password policies configured"
simulate_output "[$(date)] Password policies configured"

# Simulate checking open ports
simulate_output "\nChecking for open ports..."
simulate_output "Open ports saved to open_ports.txt"
simulate_output "[$(date)] Open ports saved to open_ports.txt"
simulate_output "Found 7 listening ports"
simulate_output "[$(date)] Found 7 listening ports"

# Simulate checking running processes
simulate_output "\nChecking for running processes..."
simulate_output "Running processes saved to running_processes.txt"
simulate_output "[$(date)] Running processes saved to running_processes.txt"

# Simulate disabling core dumps
simulate_output "\nDisabling core dumps..."
simulate_output "Core dumps disabled"
simulate_output "[$(date)] Core dumps disabled"

# Simulate final message
simulate_output "\nHardening complete! Estimated 70% vulnerability reduction."
simulate_output "Services disabled: bluetooth telnet cups avahi-daemon rpcbind nfs autofs"
simulate_output "Files secured: /etc/shadow, /etc/passwd, /etc/group, /etc/ssh/sshd_config"
simulate_output "Security enhancements:"
simulate_output "  - Firewall configured"
simulate_output "  - SSH hardened"
simulate_output "  - Password policies enforced"
simulate_output "  - System updated"
simulate_output "  - Core dumps disabled"
simulate_output "Open ports: 7 ports found and logged to open_ports.txt"
simulate_output "Running processes logged to running_processes.txt"
simulate_output "Logs saved to: hardening.log, hardening_errors.log (if errors occurred)"

# Simulate running tests
simulate_output "\nDo you want to run tests to verify hardening measures? (y/n)"
simulate_output "y"

simulate_output "\nTesting hardening measures...\n"
simulate_output "[$(date)] Testing hardening measures"

# Test 1: Services
simulate_output "Test 1: Checking disabled services..."
for service in "${SERVICES[@]}"; do
    simulate_output "✓ $service is disabled"
done

# Test 2: File permissions
simulate_output "\nTest 2: Checking file permissions..."
simulate_output "✓ /etc/shadow has correct permissions (600)"
simulate_output "✓ /etc/passwd has correct permissions (644)"
simulate_output "✓ /etc/group has correct permissions (644)"
simulate_output "✓ /etc/ssh/sshd_config has correct permissions (600)"

# Test 3: SSH configuration
simulate_output "\nTest 3: Checking SSH configuration..."
SSH_PARAMS=(
    "PermitRootLogin no"
    "PasswordAuthentication no"
    "PermitEmptyPasswords no"
    "Protocol 2"
    "X11Forwarding no"
    "MaxAuthTries 4"
    "ClientAliveInterval 300"
    "ClientAliveCountMax 0"
)
for param in "${SSH_PARAMS[@]}"; do
    key=$(echo "$param" | cut -d' ' -f1)
    value=$(echo "$param" | cut -d' ' -f2-)
    simulate_output "✓ SSH parameter $key is correctly set to $value"
done

# Test 4: Firewall status
simulate_output "\nTest 4: Checking firewall status..."
simulate_output "✓ Firewalld is active"
simulate_output "✓ SSH service is allowed in firewall"

# Test 5: Core dumps
simulate_output "\nTest 5: Checking core dumps configuration..."
simulate_output "✓ Core dumps are disabled"

# Test 6: Password policies
simulate_output "\nTest 6: Checking password policies..."
simulate_output "✓ Password policies are configured"

# Test summary
TEST_PASSED=19
TEST_FAILED=0
simulate_output "\nTest Summary:"
simulate_output "Tests passed: $TEST_PASSED"
simulate_output "Tests failed: $TEST_FAILED"
simulate_output "Total tests: $((TEST_PASSED + TEST_FAILED))"
simulate_output "[$(date)] Testing completed - Passed: $TEST_PASSED, Failed: $TEST_FAILED"
simulate_output "\nAll tests passed! System hardening was successful."

simulate_output "\n==============================================\n"
simulate_output "Demo completed! Output saved to $OUTPUT_FILE"
simulate_output "This file demonstrates how the hardening script would run on a real system."
simulate_output "==============================================\n"

echo "\nDemo script completed. The simulated output has been saved to $OUTPUT_FILE"
echo "You can view it with: cat $OUTPUT_FILE"