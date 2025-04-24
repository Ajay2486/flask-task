#!/bin/bash
sudo apt update
sudo apt install -y python3 python3-pip

pip3 install flask

mkdir -p /opt/flaskapp
cp app/* /opt/flaskapp/

# systemd service
cat <<EOF | sudo tee /etc/systemd/system/flaskapp.service
[Unit]
Description=Flask Hello World App
After=network.target

[Service]
User=ubuntu
WorkingDirectory=/opt/flaskapp
ExecStart=/usr/bin/python3 /opt/flaskapp/app.py
Restart=always

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl enable flaskapp
sudo systemctl start flaskapp