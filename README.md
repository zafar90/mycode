Task number 3 details.
Script nodejspr.sh takes the arguments if arguments count is more than 0.
Input is passed to python script processjson.py which formats the data in json format.
config.json file will be updated with corresponding values for the keys that have empty("") values.
Changes the ownership for all the files under /home/testuser/mycode to username ‘testuser’
Folder is archived(.tar.gz), checksum and scp the archive to another machine that has dns ‘ ”. SSHlogin is used for remote login for ‘testuser’.
Stop the service with name ‘node’ 
Moves and archives to /user/node/data and  then unarchives the contents 
Starts the service with name ‘custom-node’ 
Checks the end point ‘node2’ for success return(code 200)
