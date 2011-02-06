#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

ssh-agent -s > ~/.ssh-agent
source ~/.ssh-agent
ssh-add

#fetchmail -d 300
syndaemon -dti 4 
setxkbmap -option ctrl:nocaps
xmodmap -e "keycode 49 = section plusminus"
xmodmap -e "keycode 94 = grave asciitilde"
for i in /home/troels/fonts/*; do
	xset +fp "$i"
done
conkeror &
emacs &
exec xmonad
