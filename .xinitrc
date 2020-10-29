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

# Fix for IntelliJ / Java AWT Apps
wmname LG3D

# Make the cursor not an X on spots like desktop area
xsetroot -cursor_name left_ptr

# Configure monitor layout
xrandr --output DP-2 --primary --pos 1920x200
xrandr --output HDMI-3 --pos 0x600
xrandr --output DP-1 --right-of DP-2 --rotate left

# Make sure displays won't blank
xset -dpms s off

# Load random wallpapers with feh
feh --randomize --bg-fill --recursive pictures/wallpapers

# Start picom
# picom &

# Start polybar
~/.config/polybar/launch.sh &

# Load sxhkd and start bspwm
exec sxhkd &
exec bspwm
