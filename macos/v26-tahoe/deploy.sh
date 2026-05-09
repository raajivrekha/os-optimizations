#!/bin/bash
# ==============================================================================
# FILE NAME: deploy.sh
# DESCRIPTION: Securely deploys configuration files with correct permissions.
# ==============================================================================

# Ensure we are running as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root (sudo ./deploy.sh)"
  exit
fi

echo "Deploying macOS v26-Tahoe Optimizations..."

# 1. Copy files to /etc
cp ./etc/sysctl.conf /etc/sysctl.conf
cp ./etc/nsmb.conf /etc/nsmb.conf

# 2. Set Ownership to root:wheel
chown root:wheel /etc/sysctl.conf
chown root:wheel /etc/nsmb.conf

# 3. Set Permissions to 644 (rw-r--r--)
chmod 644 /etc/sysctl.conf
chmod 644 /etc/nsmb.conf

echo "Deployment complete. Reboot required for sysctl changes."
