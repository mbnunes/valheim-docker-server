#!/bin/bash

cd ~/ 

steamcmd +login anonymous +force_install_dir "${STEAMAPPDIR}" +app_update "${STEAMAPPID}" validate +exit 

cd "${STEAMAPPDIR}" 

echo '#!/bin/bash 
    export templdpath=$LD_LIBRARY_PATH 
    export LD_LIBRARY_PATH=./linux64:$LD_LIBRARY_PATH 
    export SteamAppId='"${STEAMAPPID}"' 

    # Tip: Make a local copy of this script to avoid it being overwritten by steam.
    # NOTE: Minimum password length is 5 characters & Password cant be in the server name.
    # NOTE: You need to make sure the ports 2456-2458 is being forwarded to your server through your local router & firewall.
    /home/username/.steam/steamcmd/steamcmd.sh +login anonymous +force_install_dir '"${STEAMAPPDIR}"' 
    /home/username/Valheim +app_update '"${STEAMAPPID}"' +quit 

    ./valheim_server.x86_64 -name '"${NAME}"' -port 2456 -world '"${WORLDNAME}"' -password '"${WORLDPASS}"' -public 1  

    export LD_LIBRARY_PATH=$templdpath 

    echo "Server started" 
    echo "" 
    #read -p "Press RETURN to stop server" 
    #echo 1 > server_exit.drp 

    #echo "Server exit signal set" 
    #echo "You can now close this terminal" 

    while : 
    do 
    TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S+') 
    echo "valheim.service: timestamp ${TIMESTAMP}" 
    sleep 60 
    done ' >> start_valheim.sh 

./start_valheim.sh