#!/bin/bash

instanceHost=$( cat /etc/hostname )
[[ $(tail -n 1 /etc/hosts) != 127.0.1.1* ]] && echo "127.0.1.1 $instanceHost"| sudo tee -a /etc/hosts
