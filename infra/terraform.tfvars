bucket_name = "dev-proj-1-remote-state-bucket-301971"
name        = "environment"
environment = "dev-1"
vpc_cidr             = "10.0.0.0/16"
vpc_name             = "dev-proj-eu-central-vpc-1"
cidr_public_subnet   = ["10.0.1.0/24", "10.0.2.0/24"]
cidr_private_subnet  = ["10.0.3.0/24", "10.0.4.0/24"]
eu_availability_zone = ["eu-central-1a", "eu-central-1b"]
public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIF/YYD/C6ISRjxHc35WZD0YrFPYk5iUKeg+YCSfDcymz smart@smart_sujeeth"
ec2_ami_id = "ami-02003f9f0fde924ea"
domain_name = "codewithjoker.online"
ec2_user_data_install_apache = templatefile("./template/ec2_python_application.sh", {})
ec2_python_application = <<EOF
#!/bin/bash
# shellcheck disable=SC2164
cd /home/ubuntu
yes | sudo apt update
yes | sudo apt install python3 python3-pip
git clone https://github.com/sujeethmoolya/python-mysql-db-proj-1.git
sleep 20
# shellcheck disable=SC2164
cd python-mysql-db-proj-1
pip3 install -r requirements.txt
echo 'Waiting for 30 seconds before running the app.py'
setsid python3 -u app.py &
sleep 30
EOF
