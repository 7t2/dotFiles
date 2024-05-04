#!/bin/bash

# Consider removing --delete
echo "Copying from /home/hunter to /mnt/raid/nvmeBackup"
rsync --delete -a -r --partial -hh --info=stats1,progress2 --exclude='.local' --exclude='.cache' /home/hunter/ /mnt/raid/nvmeBackup/

# Consider removing --delete or start taking zfs snapshots
echo "Copying from /mnt/raid to mi25:/mnt/zfspool/hunter/raidBackup/"
rsync --delete -a -r --partial -hh --info=stats1,progress2 /mnt/raid/ mi25:/mnt/zfspool/hunter/raidBackup/
