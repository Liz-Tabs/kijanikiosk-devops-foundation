#!/bin/bash
set -e

cd terraform

terraform apply -auto-approve

API_IP=$(multipass info kijanikiosk-api | awk '/IPv4/ {print $2}')
PAY_IP=$(multipass info kijanikiosk-payments | awk '/IPv4/ {print $2}')
LOG_IP=$(multipass info kijanikiosk-logs | awk '/IPv4/ {print $2}')

cat > ../ansible/inventory.ini <<EOF
[api_servers]
api01 ansible_host=$API_IP

[payment_servers]
payments01 ansible_host=$PAY_IP

[log_servers]
logs01 ansible_host=$LOG_IP

[all:vars]
ansible_user=ubuntu
ansible_ssh_private_key_file=/home/liz/.ssh/id_ed25519
EOF

cd ../ansible

ansible-playbook -i inventory.ini site.yml

echo "Checking services..."

ansible api_servers -i ansible/inventory.ini \
-m shell \
-a "systemctl is-active kijanikiosk-api"

ansible payment_servers -i ansible/inventory.ini \
-m shell \
-a "systemctl is-active kijanikiosk-payments"

ansible log_servers -i ansible/inventory.ini \
-m shell \
-a "systemctl is-active rsyslog"
