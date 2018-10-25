#!/bin/bash

#check out the code latest code from git

git pull

paramscount=$(echo $1 | wc -w)

if [[ $paramscount > 0 ]]; then
	python processjson.py $1

	if [[ $? ]]; then

        	echo "config file has updated"
	else
        	echo "something went wrong in config file update."
	fi
fi

sudo chown testuser:testuser -R /home/testuser/mycode

if [[ $? ]]; then

	echo "changed all files owner to testuser"
else
	echo "something went wrong in change the ownership."
fi

sudo tar --exclude=/home/testuser/mycode/.git -czf /home/testuser/mycode.tar.gz *.*

echo "tar file has created successfully."

sudo chmod 777 /home/testuser/mycode.tar.gz

sudo chown testuser:testuser /home/testuser/mycode.tar.gz
scp /home/testuser/mycode.tar.gz testuser@192.168.33.11:/home/testuser/
ssh testuser@192.168.33.11 "sudo systemctl stop custom-node.service"
ssh testuser@192.168.33.11 "tar -xzvf mycode.tar.gz -C /home/testuser/mycode"
ssh testuser@192.168.33.11 "cd mycode; sudo npm install"
ssh testuser@192.168.33.11 "sudo systemctl start custom-node.service; sudo systemctl status custom-node.service"
sleep 20

status=$(curl -LIs http://192.168.33.11:3000 | grep 200 | wc -l)

if [[ $status > 0 ]]; then

	echo "Site up and running with status code 200"
else 
	echo "Something went wrong to access the site."
fi
