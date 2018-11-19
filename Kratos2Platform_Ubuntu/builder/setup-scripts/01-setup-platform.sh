#   Copyright 2016-2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
#
#   Licensed under the Apache License, Version 2.0 (the "License"). You may not use this file except in compliance with the License. A copy of the License is located at
#
#   http://aws.amazon.com/apache2.0/
#
#   or in the "license" file accompanying this file. This file is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

#!/bin/bash -xe

. $BUILDER_DIR/CONFIG

### INSTALL AND VALIDATE NODE ####
echo "SETTING UP NODE ON THE INSTANCE"
apt install -y wget tree


echo "Creating base directories for platform."
mkdir -p $BEANSTALK_DIR/deploy/appsource/
mkdir -p /var/app/staging
mkdir -p /var/app/current
mkdir -p /var/log/nginx/healthd/
chown www-data:www-data /var/log/nginx/healthd/

apt install -y git
