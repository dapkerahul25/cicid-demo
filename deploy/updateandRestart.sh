#!/bin/bash

# any future command that fails will exit the script
set -e

# Nukes all Node processes
#killall -9 node

# Delete the old repo
cd /home/ubuntu/rd
rm -rf cicd-demo
rm -f cicd-demo.zip



# clone the repo again
git clone https://$uname:$upwd@github.com/rahul.dapke/cicd-demo.git

#source the nvm file. In an non
#If you are not using nvm, add the actual path like
# PATH=/home/ubuntu/node/bin:$PATH
#source /home/ubuntu/.nvm/nvm.sh

# stop the previous pm2
pm2 kill
#npm remove pm2 -g


#pm2 needs to be installed globally as we would be deleting the repo folder.
# this needs to be done only once as a setup script.
#npm install pm2 -g
# starting pm2 daemon
pm2 status

cd /home/ubuntu/rd/cicd-demo

#install npm packages
echo "Running npm install"
npm install

#Restart the node server
#node server
cd /home/ubuntu/rd/cicd-demo
zip -r /home/ubuntu/rd/cicd-demo.zip .


# add to ./*shrc
export PATH=$PATH:~/.local/bin/

pip install --upgrade --user awsebcli
cd /home/ubuntu/rd/cicd-demo
pwd
eb deploy nodejs-cicd-dev2
