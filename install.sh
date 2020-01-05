#!/bin/bash
#
# Perorms the following tasks:
# Install awscli
# Check user's AWS credentials (requires role - see README.md) 
# Install dependencies
# 

LETSENCRYPT_INSTALL_DIR=${LETSENCRYPT_INSTALL_DIR:-~/lets-encrypt}
AWS_HZ=${AWS_HZ:-mzborowski.com}
AWS_PROFILE_NAME=${AWS_PROFILE_NAME:-certbot}
LOGS_DIR=${LOG_DIR:-$LETSENCRYPT_INSTALL_DIR/logs}
CONFIG_DIR=${CONFIG_DIR:-$LETSENCRYPT_INSTALL_DIR/config}
EMAIL=${EMAIL:-mzborowski@yahoo.com}

echo "${LETSENCRYPT_INSTALL_DIR}"
echo "$LETSENCRYPT_INSTALL_DIR"


if [ `grep "profile ${AWS_PROFILE_NAME}" ~/.aws/config` ] && [ $? -ne 0 ]; then
	echo "No certbot profile found!"
	echo "Add certbot's IAM credentials to the \"certbot\" profile and try again."
	echo "Exiting..."
        { exit 1; }
fi

# Install awscli via pip3 
#if [ `which aws &>/dev/null` && $? -ne 0 ] 
# pip3 install awscli --upgrade --user


# certbot certonly \
#       -d $AWS_HZ -d *.$AWS_HZ \
#       --dns-route53 \
#       --logs-dir $LOGS_DIR \
#       --config-dir $CONFIG_DIR \
#       --work-dir $WORK_DIR \
#       -m $EMAIL \
#       --agree-tos --non-interactive --server https://acme-v02.api.letsencrypt.org/directory

#    mkdir -p $LETSENCRYPT_INSTALL_DIR/work
#    mkdir -p $LETSENCRYPT_INSTALL_DIR/config
#    sudo apt-get install software-properties-common
#    sudo add-apt-repository ppa:certbot/certbot
#    sudo apt-get update
#    sudo apt-get install python-certbot-nginx
#    sudo apt-get update && sudo apt-get -y upgrade
#    pip install certbot_dns_route53==0.22.2
#    apt-get install python-pip
#    pip install certbot_dns_route53==0.22.2



function Install_Certbot(){
# per https://certbot.eff.org/lets-encrypt/centosrhel8-nginx.html
	wget https://dl.eff.org/certbot-auto
sudo mv certbot-auto /usr/local/bin/certbot-auto
sudo chown root /usr/local/bin/certbot-auto
sudo chmod 0755 /usr/local/bin/certbot-auto

sudo /usr/local/bin/certbot-auto certonly --nginx

echo "0 0,12 * * * root python -c 'import random; import time; time.sleep(random.random() * 3600)' && /usr/local/bin/certbot-auto renew" | sudo tee -a /etc/crontab > /dev/null
}
