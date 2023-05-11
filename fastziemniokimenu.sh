#!/bin/bash

while true; do
    clear
    echo "Type version of minecraft:"
    echo "1.17-1.17.1"
    echo "1.18-1.18.2"
    echo "1.19-1.19.4"
    echo "0. Exit"

    read -p "" download

    case $download in
        "1.17" | "1.17.1" | "1.18" | "1.18.1" | "1.18.2" | "1.19" | "1.19.1" | "1.19.2" | "1.19.3" | "1.19.4")
            apt update
            yes | apt install -y htop screen wget openjdk-17-jdk cron
            wget https://download.getbukkit.org/spigot/spigot-$download.jar

            wget https://github.com/Tajwus/ziemniokimenu/archive/refs/tags/Update_v1.tar.gz
            tar -zxf Update_v1.tar.gz
            mv ziemniokimenu-Update_v1/minecraft/ /opt
            mv spigot-$download.jar /opt/minecraft/server/server.jar
            chmod +x -R /opt/minecraft
            rm Update_v1.tar.gz ziemniokimenu-Update_v1

            crontab -l > mycron
            echo "0 4 * * * /opt/minecraft/scripts/backup.sh" >> mycron
            echo "*/1 * * * * /opt/minecraft/scripts/serverTrampoline.sh" >> mycron
            echo "0 4 * * * /opt/minecraft/scripts/oldBackup7.sh" >> mycron
            echo "0 4 * * * /opt/minecraft/scripts/turnOffServer.sh" >> mycron
            crontab mycron
            rm mycron

            ram=$(free -m | grep Mem | awk '{print $2}')
            available_ram=$((ram - 512))
            sed -i "s/^maxRam=.*/maxRam=$available_ram/" /opt/minecraft/scripts/path

            cpuA=$(nproc)
            cpu=$((cpuA - 1))
            sed -i "s/^cpu=.*/cpu=$cpu/" /opt/minecraft/scripts/path

            echo ""
            echo "Done."
            echo ""
            read -n 1 -s -r -p "Press any key happ"
            exit 0
        ;;
        "0")
            exit 0
        ;;
        *)
            echo "Invalid version..."
            read -n 1 -s -r -p "Press any key happ"
        ;;
    esac
done
