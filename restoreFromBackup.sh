source /opt/minecraft/scripts/path
PS3='Select backup:'
select file in /opt/backup/*.tar.gz
do
        case $file in
                *.tar.gz)
                   bash /opt/minecraft/scripts/backup.sh
                   backupDir=$(basename "$file" .tar.gz)
                   mkdir -p "$backup/$backupDir"
                   tar -zxf "$file" -C "$backup/$backupDir"
                   rm -rf "$server/*"
                   cp -r "$backup/$backupDir/"* "$server/"
                   rm -rf "$backup/$backupDir"
                   echo "Done."
                   echo ""
                   read -n 1 -s -r -p "Press any key to continue..."
                   exit
                   ;;
                0)
                   exit 1
                   ;;
                *)
                   echo "Invalid selection."
                   ;;
        esac
done
