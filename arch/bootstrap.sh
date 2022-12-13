iwctl station wlan0 connect WIFI_NAME --passphrase WIFI_PASSWORD
ping -c 1 cn.bing.com

mkfs.fat -F 32 /dev/nvme0n1p1
mkfs.xfs -f /dev/nvme0n1p2

mount /dev/nvme0n1p2 /mnt
mount /dev/nvme0n1p1 /mnt/boot --mkdir

reflector --country China --age 24 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
sed -i "s/#Parallel/Parallel/g" /etc/pacman.conf

pacstrap /mnt \
  base base-devel linux linux-firmware amd-ucode \
  vim networkmanager \
  gdm gnome-control-center gnome-keyring

genfstab -U /mnt >> /mnt/etc/fstab
