#! /bin/bash
# shellcheck disable=SC2164
cd /home/ubuntu
yes | sudo apt update
yes | sudo apt install python3 python3-pip
yes | sudo apt install python3-pymysql
sudo apt update
yes | sudo apt install python3-flask
git clone https://github.com/sujeethmoolya/python-flash-application-with-database.git
# shellcheck disable=SC2164
cd python-flash-application-with-database
pip3 install -r requirements.txt
echo 'Waiting for 30 seconds before running the app.py'
setsid python3 -u app.py &
sleep 30
