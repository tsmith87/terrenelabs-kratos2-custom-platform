#   Copyright 2016-2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
#
#   Licensed under the Apache License, Version 2.0 (the "License"). You may not use this file except in compliance with the License. A copy of the License is located at
#
#   http://aws.amazon.com/apache2.0/
#
#   or in the "license" file accompanying this file. This file is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

#!/bin/bash

. /etc/Kratos2_Platform/platform.config

if /opt/elasticbeanstalk/bin/download-source-bundle; then
	rm -rf $STAGING_DIR
	mkdir -p $STAGING_DIR
	if file --mime-type /opt/elasticbeanstalk/deploy/appsource/source_bundle | grep -q zip$; then
  		unzip -o -d $STAGING_DIR /opt/elasticbeanstalk/deploy/appsource/source_bundle
  		sudo unzip -o /var/app/current/Kratos2.jar
  		sudo chown -R ubuntu /var/app/current/*
	elif file --mime-type /opt/elasticbeanstalk/deploy/appsource/source_bundle | grep -q java-archive$; then
  		unzip -o -d $STAGING_DIR /opt/elasticbeanstalk/deploy/appsource/source_bundle
  		sudo chown -R ubuntu /var/app/current/*
	fi
	rm -rf $STAGING_DIR/.ebextensions
else
	echo "No application version available."
fi
