#!/bin/sh

sudo supervisorctl reread
sudo service supervisor stop
sudo service supervisor start
echo "[Configuration Deployment] Executed when starting configuration deployment"
