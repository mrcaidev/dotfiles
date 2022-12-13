echo "root:ROOT_PASSWORD" | chpasswd
echo "%wheel ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers.d/nopasswd
useradd -mG wheel USER_NAME
echo "USER_NAME:USER_PASSWORD" | chpasswd

sed -i "s/#Color/Color/g" /etc/pacman.conf
sed -i "s/#Parallel/Parallel/g" /etc/pacman.conf
echo "Server = https://mirrors.aliyun.com/archlinux/\$repo/os/\$arch" > /etc/pacman.d/mirrorlist

pacman -Syu --noconfirm \
    gcc git github-cli \
    nodejs npm openssh \
    python python-pip python-pipenv \
    starship vim \
    zsh zsh-autosuggestions zsh-syntax-highlighting
