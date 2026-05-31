# TODO:
# - look into stow for simplifying/organising symlinks

# ------------------------------------------------
#  System
# ------------------------------------------------
# Full system upgrade
sudo pacman -Syyu

# Install yay for AUR packages
git clone https://aur.archlinux.org/yay.git ~/yay
cd ~/yay
makepkg -si

# Supress GRUB menu by setting timeout to zero
# Set the following in /etc/default/grub:
# GRUB_TIMEOUT=0
# GRUB_TIMEOUT_STYLE=hidden
# And regenerate GRUB with sudo grub-mkconfig -o /boot/grub/grub.cfg

# Splash screen to hide logs on boot
sudo pacman -S plymouth
# Set the following in /etc/default/grub:
# GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet splash"
# Need to add plymouth to HOOKS in /etc/mkinitcpio.conf
# (after systemd and before autodetect)
# Then rebuild with sudo mkinitcpio -P
# And regenerate GRUB with sudo grub-mkconfig -o /boot/grub/grub.cfg
# ------------------------------------------------
#  Display manager (login screen)
# ------------------------------------------------
sudo pacman -S sddm
sudo systemctl enable sddm.service

# Install and setup theme
bash -c "$(curl -fsSL https://raw.githubusercontent.com/keyitdev/sddm-astronaut-theme/master/setup.sh)"
# ------------------------------------------------
#  Hyprland
# ------------------------------------------------
sudo pacman -S hyprland

# Symlink config
ln -sfn ~/Repos/arch_configs/hypr/ ~/.config/hypr

# Lock screen
sudo pacman -S hyprlock

# Wallpaper
sudo pacman -S hyprpaper
# ------------------------------------------------
#  Waybar
# ------------------------------------------------
sudo pacman -S waybar

# Symlink config
ln -sfn ~/Repos/arch_configs/waybar/ ~/.config/waybar

# Fonts for waybar (install and refresh cache)
sudo pacman -S ttf-firacode-nerd ttf-nerd-fonts-symbols-mono
fc-cache -fv
# ------------------------------------------------
#  Emacs
# ------------------------------------------------
sudo pacman -S emacs

git clone git@github.com:alextrenam/emacs_config ~/Repos/emacs_config

# Symlink config
ln -sfn ~/Repos/emacs_config/init.el ~/.emacs.d/init.el

# Fonts for emacs
sudo pacman -S ttf-fira-code
fc-cache -fv

# Vterm requires CMake
sudo pacman -S cmake
# ------------------------------------------------
#  Steam
# ------------------------------------------------
# Need to enable 32-bit libraries by editing /etc/pacman.conf
# Make sure the following is uncommented:
# [multilib]
# Include = /etc/pacman.d/mirrorlist

sudo pacman -S steam
# ------------------------------------------------
#  Screenshots
# ------------------------------------------------
sudo pacman -S grim slurp wl-clipboard swappy
yay -S hyprshot
# ------------------------------------------------
#  Zoom and Teams
# ------------------------------------------------
# Screen sharing and capture
sudo pacman -S xdg-desktop-portal xdg-desktop-portal-hyprland

sudo pacman -S pipewire wireplumber

yay -S zoom teams-for-linux
