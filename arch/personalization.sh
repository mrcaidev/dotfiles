echo "root:siaoca@r708401" | chpasswd

useradd -mG wheel mrcai
echo "mrcai:siaoca@m708401" | chpasswd

echo "%wheel ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers.d/nopasswd
cat /etc/sudoers.d/nopasswd

systemctl enable systemd-boot-update NetworkManager gdm

bootctl install
echo "editor no" > /boot/loader/loader.conf
sed -i "s/base udev/base systemd/g" /etc/mkinitcpio.conf
echo "ALL_config='/etc/mkinitcpio.conf'" > /etc/mkinitcpio.d/linux.preset
echo "ALL_kver='/boot/vmlinuz-linux'" >> /etc/mkinitcpio.d/linux.preset
echo "ALL_microcode='/boot/amd-ucode.img'" >> /etc/mkinitcpio.d/linux.preset
echo "PRESETS=('default' 'fallback')" >> /etc/mkinitcpio.d/linux.preset
echo "default_image='/boot/initramfs-linux.img'" >> /etc/mkinitcpio.d/linux.preset
echo "default_efi_image='/boot/EFI/Linux/arch.efi'" >> /etc/mkinitcpio.d/linux.preset
echo "default_options='--splash /usr/share/systemd/bootctl/splash-arch.bmp'" >> /etc/mkinitcpio.d/linux.preset
echo "fallback_image='/boot/initramfs-linux-fallback.img'" >> /etc/mkinitcpio.d/linux.preset
echo "fallback_efi_image='/boot/EFI/Linux/arch-fallback.efi'" >> /etc/mkinitcpio.d/linux.preset
echo "fallback_options='-S autodetect --splash /usr/share/systemd/bootctl/splash-arch.bmp'" >> /etc/mkinitcpio.d/linux.preset
echo "root=PARTUUID=52685e75-efd2-cb4c-a4c6-af502c71dd76 rw quiet bgrt_disable" > /etc/kernel/cmdline
mkinitcpio -P

timedatectl set-ntp true
timedatectl set-timezone Asia/Shanghai
hwclock --systohc

sed -i "s/#en_US.UTF-8/en_US.UTF-8/" /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf

hostnamectl set-hostname arch
echo "arch" > /etc/hostname
echo "127.0.0.1  localhost" >> /etc/hosts
echo "::1        localhost" >> /etc/hosts
echo "127.0.1.1  arch" >> /etc/hosts

sed -i "s/#Color/Color/" /etc/pacman.conf
sed -i "s/#Parallel/Parallel/g" /etc/pacman.conf
echo "Server = https://mirrors.aliyun.com/archlinux/\$repo/os/\$arch" > /etc/pacman.d/mirrorlist
echo "[archlinuxcn]" >> /etc/pacman.conf
echo "Server = https://mirrors.aliyun.com/archlinuxcn/\$arch" >> /etc/pacman.conf

pacman -Sy --noconfirm archlinuxcn-keyring
pacman -Syu --noconfirm

pacman -S --noconfirm \
  chromium docker docker-compose \
  fcitx5-im fcitx5-chinese-addons feishu-bin git github-cli \
  gnome-browser-connector gnome-characters gnome-tweaks \
  icalingua++ nautilus nerd-fonts-fira-code nodejs \
  noto-fonts noto-fonts-cjk noto-fonts-emoji \
  npm screen screenfetch starship tilix tree \
  ufw v2ray v2raya yay \
  zsh zsh-autosuggestions zsh-syntax-highlighting

systemctl enable docker
usermod -aG docker mrcai

echo "GTK_IM_MODULE=fcitx5" >> /etc/environment
echo "QT_IM_MODULE=fcitx5" >> /etc/environment
echo "XMODIFIERS=@im=fcitx5" >> /etc/environment

sed -i "s/Icon=feishu/Icon=bytedance-feishu/" /usr/share/applications/feishu.desktop

systemctl enable ufw

systemctl enable v2raya
