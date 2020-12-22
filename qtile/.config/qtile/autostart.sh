#!/bin/bash
nitrogen --restore &
picom &
urxvtd -q -o -f &
/usr/bin/emacs --daemon &
xmodmap ~/.Xmodmap &
xmodmap -e 'clear lock' &
xmodmap -e 'clear Mod1' &
xmodmap -e 'add Mod1 = Alt_L Meta_L' &
