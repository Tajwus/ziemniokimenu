#!/bin/bash

function z1 {
   function c1 {
      sudo apt update
      yes | sudo apt install htop screen wget
      mkdir -p /opt/minecraft/scripts
      mkdir -p /opt/minecraft/server
      echo "eula=true" > /opt/minecraft/server/eula.txt

      wget https://github.com/Tajwus/ziemniokimenu/archive/refs/tags/scripts.tar.gz
      tar -zxf scripts.tar.gz
      cd ziemniokimenu-scripts
      mv start.sh server.properties server-icon.png /opt/minecraft/server
      chmod +x /opt/minecraft/server/start.sh
      mv * /opt/minecraft/scripts
      chmod +x -R /opt/minecraft/scripts
      cd ..
      rm -rf ziemniokimenu-scripts scripts.tar.gz

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

      sudo mv ziemniokimenu.sh /usr/local/bin/ziemniokimenu
      sudo chmod +x /usr/local/bin/ziemniokimenu
      source ~/.bashrc

      echo ""
      echo "Done."
      echo ""
      read -n 1 -s -r -p "Press any key happ"

   }

   function c2 {
      clear
      echo "Type version of minecraft:"
      echo "1.17-1.17.1"
      echo "1.18-1.18.2"
      echo "1.19-1.19.4"
      echo "0. Back"

      read -p "" download

      case $download in
         yes | apt install wget
         "1.17" | "1.17.1" | "1.18" | "1.18.1" | "1.18.2" | "1.19" | "1.19.1" | "1.19.2" | "1.19.3" | "1.19.4")
         wget https://download.getbukkit.org/spigot/spigot-$download.jar
         mv spigot-$download.jar /opt/minecraft/server/server.jar

         echo "Done."
         echo ""
         read -n 1 -s -r -p "Press any key happ"
         ;;
      0)
         return 1
         ;;

      esac
   }

   function c3 {
      ram=$(free -m | grep Mem | awk '{print $2}')
      ramA=$((ram - 512))
      sed -i "s/^maxRam=.*/maxRam=$ramA/" /opt/minecraft/scripts/path

      cpuA=$(nproc)
      cpu=$((cpuA - 1))
      sed -i "s/^cpu=.*/cpu=$cpu/" /opt/minecraft/scripts/path

      echo ""
      echo "CPU threds set to: ${cpuA}"
      echo "Max Ram set to: ${ramA} MB"
      echo "Done."
      echo ""
      read -n 1 -s -r -p "Press any key happ"
   }

   while true; do
      clear
      echo " /00000000 /000000 /00000000 /00      /00 /00   /00 /000000  /000000  /00   /00 /000000       /00      /00 /00000000 /00   /00 /00   /00"
      echo "|_____ 00 |_  00_/| 00_____/| 000    /000| 000 | 00|_  00_/ /00__  00| 00  /00/|_  00_/      | 000    /000| 00_____/| 000 | 00| 00  | 00"
      echo "     /00/   | 00  | 00      | 0000  /0000| 0000| 00  | 00  | 00  \ 00| 00 /00/   | 00        | 0000  /0000| 00      | 0000| 00| 00  | 00"
      echo "    /00/    | 00  | 00000   | 00 00/00 00| 00 00 00  | 00  | 00  | 00| 00000/    | 00        | 00 00/00 00| 00000   | 00 00 00| 00  | 00"
      echo "   /00/     | 00  | 00__/   | 00  000| 00| 00  0000  | 00  | 00  | 00| 00  00    | 00        | 00  000| 00| 00__/   | 00  0000| 00  | 00"
      echo "  /00/      | 00  | 00      | 00\  0 | 00| 00\  000  | 00  | 00  | 00| 00\  00   | 00        | 00\  0 | 00| 00      | 00\  000| 00  | 00"
      echo " /00000000 /000000| 00000000| 00 \/  | 00| 00 \  00 /000000|  000000/| 00 \  00 /000000      | 00 \/  | 00| 00000000| 00 \  00|  000000/"
      echo "|________/|______/|________/|__/     |__/|__/  \__/|______/ \______/ |__/  \__/|______/      |__/     |__/|________/|__/  \__/ \______/"
      echo ""
      echo "Crafting Server:"
      echo "1. Starter kit"
      echo "2. Download spigot server"
      echo "3. Update CPU and RAM values"
      echo "0. Back"

      read -p "" crafting

      case $crafting in
         1)
            c1
            ;;
         2)
            c2
            ;;
         3)
            c3
            ;;
         0)
            return 1
            ;;
         00)
            clear
            exit 0
            ;;
         *)
            echo""
            echo "ERROR"
            read -n 1 -s -r -p "Press any key happ"
            ;;
      esac
   done
}

function z2 {
   function j1 {
      sudo apt update
      yes | apt install wget
      wget https://raw.githubusercontent.com/chrishantha/install-java/master/install-java.sh
      wget http://g09.rfox.cloud/jdk17.tar.gz
      chmod +x install-java.sh
      yes | ./install-java.sh -f jdk17.tar.gz
      rm -r install-java.sh jdk17.tar.gz
   }

   function j2 {
      java -version
      read -n 1 -s -r -p "Press any key happ"
   }

   function j3 {
      sudo update-alternatives --config java
      read -n 1 -s -r -p "Press any key happ"
   }

   while true; do
      clear
      echo " /00000000 /000000 /00000000 /00      /00 /00   /00 /000000  /000000  /00   /00 /000000       /00      /00 /00000000 /00   /00 /00   /00"
      echo "|_____ 00 |_  00_/| 00_____/| 000    /000| 000 | 00|_  00_/ /00__  00| 00  /00/|_  00_/      | 000    /000| 00_____/| 000 | 00| 00  | 00"
      echo "     /00/   | 00  | 00      | 0000  /0000| 0000| 00  | 00  | 00  \ 00| 00 /00/   | 00        | 0000  /0000| 00      | 0000| 00| 00  | 00"
      echo "    /00/    | 00  | 00000   | 00 00/00 00| 00 00 00  | 00  | 00  | 00| 00000/    | 00        | 00 00/00 00| 00000   | 00 00 00| 00  | 00"
      echo "   /00/     | 00  | 00__/   | 00  000| 00| 00  0000  | 00  | 00  | 00| 00  00    | 00        | 00  000| 00| 00__/   | 00  0000| 00  | 00"
      echo "  /00/      | 00  | 00      | 00\  0 | 00| 00\  000  | 00  | 00  | 00| 00\  00   | 00        | 00\  0 | 00| 00      | 00\  000| 00  | 00"
      echo " /00000000 /000000| 00000000| 00 \/  | 00| 00 \  00 /000000|  000000/| 00 \  00 /000000      | 00 \/  | 00| 00000000| 00 \  00|  000000/"
      echo "|________/|______/|________/|__/     |__/|__/  \__/|______/ \______/ |__/  \__/|______/      |__/     |__/|________/|__/  \__/ \______/"
      echo ""
      echo "JAVA OPTIONS:"
      echo "1. Install JAVA 17"
      echo "2. Check Java"
      echo "3. Change Java"
      echo "0. BACK"

      read -p "" java

      case $java in
         1)
            j1
            ;;
         2)
            j2
            ;;
         3)
            j3
            ;;
         0)
            return 1
            ;;
         00)
            clear
            exit 0
            ;;
         *)
            echo ""
            echo "ERROR"
            read -n 1 -s -r -p "Press any key happ"
            ;;
      esac
   done
}

function z3 {
   echo "Creator Tajwus"
   echo ""
   read -n 1 -s -r -p "To go back press any key"
}

while true; do
   clear
   echo " /00000000 /000000 /00000000 /00      /00 /00   /00 /000000  /000000  /00   /00 /000000       /00      /00 /00000000 /00   /00 /00   /00"
   echo "|_____ 00 |_  00_/| 00_____/| 000    /000| 000 | 00|_  00_/ /00__  00| 00  /00/|_  00_/      | 000    /000| 00_____/| 000 | 00| 00  | 00"
   echo "     /00/   | 00  | 00      | 0000  /0000| 0000| 00  | 00  | 00  \ 00| 00 /00/   | 00        | 0000  /0000| 00      | 0000| 00| 00  | 00"
   echo "    /00/    | 00  | 00000   | 00 00/00 00| 00 00 00  | 00  | 00  | 00| 00000/    | 00        | 00 00/00 00| 00000   | 00 00 00| 00  | 00"
   echo "   /00/     | 00  | 00__/   | 00  000| 00| 00  0000  | 00  | 00  | 00| 00  00    | 00        | 00  000| 00| 00__/   | 00  0000| 00  | 00"
   echo "  /00/      | 00  | 00      | 00\  0 | 00| 00\  000  | 00  | 00  | 00| 00\  00   | 00        | 00\  0 | 00| 00      | 00\  000| 00  | 00"
   echo " /00000000 /000000| 00000000| 00 \/  | 00| 00 \  00 /000000|  000000/| 00 \  00 /000000      | 00 \/  | 00| 00000000| 00 \  00|  000000/"
   echo "|________/|______/|________/|__/     |__/|__/  \__/|______/ \______/ |__/  \__/|______/      |__/     |__/|________/|__/  \__/ \______/"
   echo ""
   echo "Menu:"
   echo "1. Craft server"
   echo "2. JAVA"
   echo "3. Info"
   echo "0. EXIT"

   read -p "" ziemnioki

   case $ziemnioki in
      1)
         z1
         ;;
      2)
         z2
         ;;
      3)
         z3
         ;;
      0)
         clear
         exit 0
         ;;
      *)
         echo ""
         echo "ERROR"
         read -n 1 -s -r -p "Press any key happ"
         ;;
   esac
done
