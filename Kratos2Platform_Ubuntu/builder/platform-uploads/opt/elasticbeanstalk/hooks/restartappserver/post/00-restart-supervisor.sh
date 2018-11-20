#!/bin/bash -e

sudo service supervisor stop
sudo service supervisor start
echo "[Restarting Application Server]/post - Step 3."
