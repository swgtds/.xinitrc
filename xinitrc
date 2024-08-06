#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

#dwm bar
/usr/local/bin/slstatus &

#set keyboard layout
/usr/bin/setxkbmap us &

#start audio-server(Pipewire)
/usr/bin/pipewire &
/usr/bin/pipewire-pulse &
/usr/bin/wireplumber &

#restore compositor
/usr/bin/picom &

#battery notification
/usr/local/bin/battery &

source /home/swag/.zshrc

#display positions
xrandr --output HDMI-1 --auto
xrandr --output eDP-1 --auto
xrandr --output eDP-1 --right-of HDMI-1
xrandr --output HDMI-1 --auto
xrandr --output eDP-1 --auto
xrandr --output eDP-1 --right-of HDMI-1

#restore nitrogen
#nitrogen --head=0 --set-zoom-fill $HOME/.current-wallpaper
#nitrogen --head=1 --set-zoom-fill $HOME/.current-wallpaper
nitrogen --head=0 --set-zoom-fill $HOME/Pictures/Wallpapers/ocean-with-cloud.png
nitrogen --head=1 --set-zoom-fill $HOME/Pictures/Wallpapers/interstellar-wallpaper.png
#nitrogen --restore &

#dwm restart loop
while true; do
	/usr/local/bin/dwm >/dev/null 2>&1
done

#execute dwm
exec dwm 
