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

# Make the cursor not an X on spots like desktop area
xsetroot -cursor_name left_ptr


# Make sure displays won't blank
xset -dpms s off


# Count monitors to separate desktop / laptop layout
MONITORS=$(xrandr --listactivemonitors | wc -l | xargs -n 1 expr -1 +)

# Desktop layout
if [[ $MONITORS -eq 3 ]]; then
    xrandr --output DP-2 --primary --pos 1920x200           # primary
    xrandr --output HDMI-3 --pos 0x600                      # left secondary
    xrandr --output DP-1 --right-of DP-2 --rotate left      # right secondary
fi


# polybar
# killall -q polybar
# polybar primary --config="$HOME/.config/polybar/config.ini" > /tmp/polybar.log 2>&1 &
$HOME/.config/polybar/launch.sh


# Load sxhkd and start bspwm
exec sxhkd &


# Load random wallpapers with feh
feh --randomize --bg-fill --recursive pictures/wallpapers &


# Start picom
picom &


# Hide cursor after idling
unclutter -idle 1 &


# bspwm
exec bspwm

