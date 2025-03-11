# RHEL/CentOS System Hardening Script

## Overview
This script provides comprehensive security hardening for RHEL/CentOS Linux systems. It implements multiple security best practices to reduce the attack surface and improve the overall security posture of your system.

## Features

- **System Updates**: Ensures the system has the latest security patches
- **Service Hardening**: Disables unnecessary and potentially vulnerable services
- **Firewall Configuration**: Sets up and configures firewall rules (firewalld or iptables)
- **SSH Hardening**: Implements secure SSH configuration settings
- **File Permissions**: Secures critical system files with appropriate permissions
- **Password Policies**: Enforces strong password requirements
- **System Monitoring**: Logs open ports and running processes
- **Error Handling**: Comprehensive error checking and logging

## Prerequisites

- Root access or sudo privileges
- RHEL/CentOS 7 or 8 system
- Basic understanding of Linux system administration

## Installation

1. Clone or download this repository to your system
2. Make the script executable:
   ```
   chmod +x harden.sh
   ```

## Usage

Run the script with root privileges:

```
sudo ./harden.sh
```

The script will:
1. Check if it's running with root privileges
2. Update the system packages
3. Disable unnecessary services
4. Configure the firewall
5. Secure critical system files
6. Harden SSH configuration
7. Configure password policies
8. Check and log open ports and running processes
9. Disable core dumps
10. Generate a summary of actions taken
11. Offer to run tests to verify hardening measures

## Logs

The script generates the following log files:
- `hardening.log`: Records all successful operations
- `hardening_errors.log`: Records any errors encountered
- `open_ports.txt`: Lists all open ports on the system
- `running_processes.txt`: Lists all running processes

## Security Enhancements

### Services Disabled
- bluetooth
- telnet
- cups (printing service)
- avahi-daemon
- rpcbind
- nfs
- autofs

### SSH Hardening
- Disables root login
- Disables password authentication (requires key-based authentication)
- Disables empty passwords
- Enforces SSH Protocol 2
- Disables X11 forwarding
- Limits authentication attempts
- Sets client alive intervals

### Password Policies
- Minimum length: 12 characters
- Requires lowercase letters
- Requires uppercase letters
- Requires digits
- Requires special characters
- Enforces password history

## Customization

You can customize the script by modifying the following sections:

- **Services**: Edit the `SERVICES` array to add or remove services to disable
- **SSH Parameters**: Modify the `SSH_PARAMS` array to change SSH configuration
- **Password Policies**: Adjust the PAM configuration parameters

## Security Considerations

- This script implements general security best practices but may need to be adjusted for your specific environment
- Some changes (especially to SSH) might impact remote access - ensure you have alternative access methods before running
- Review all changes before implementing in a production environment

## Testing Functionality

The script includes a comprehensive testing function that verifies the effectiveness of the hardening measures. When you run the script, it will offer to run tests after completing the hardening process.

The testing function checks:

1. **Service Status**: Verifies that specified services are properly disabled
2. **File Permissions**: Confirms that critical system files have the correct permissions
3. **SSH Configuration**: Validates that SSH hardening parameters are correctly applied
4. **Firewall Status**: Checks that the firewall is active and properly configured
5. **Core Dumps**: Ensures that core dumps are disabled
6. **Password Policies**: Verifies that password policies are properly configured

Each test will display a pass (✓) or fail (✗) status, with a summary at the end showing the total number of tests passed and failed.

## Troubleshooting

If you encounter issues:

1. Check the `hardening_errors.log` file for specific error messages
2. Verify that your system is compatible with the script (RHEL/CentOS 7 or 8)
3. Ensure you have root privileges when running the script
4. Review the test results to identify specific hardening measures that may have failed

## Demo Mode

The repository includes a demonstration script that simulates the execution of the hardening script without making actual system changes. This is useful for:

- Previewing what the hardening script does before running it on a production system
- Training and educational purposes
- Preparing documentation or presentations about system hardening

### Running the Demo

To run the demonstration:

```
chmod +x demo_run.sh
./demo_run.sh
```

The demo script will:
1. Simulate the entire hardening process with realistic output
2. Show timestamps for each action (using the current date)
3. Generate a sample output file (`hardening_demo_output.txt`)
4. Simulate the testing process with sample results

### Demo Output

The demonstration generates a file called `hardening_demo_output.txt` that contains a complete simulation of what you would see when running the actual hardening script, including:

- System update process
- Service disabling
- Firewall configuration
- File permission changes
- SSH hardening
- Password policy configuration
- Open ports and running processes checks
- Core dump disabling
- Test results with pass/fail indicators

This allows you to review the entire hardening process safely without modifying your system.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Disclaimer

This script is provided as-is without any warranty. Always test in a non-production environment before using in production.