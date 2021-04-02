#!/bin/bash
lxsession &
lxpolkit &
nitrogen --restore &
picom &
urxvtd -q -o -f &
xmodmap ~/.Xmodmap &
xmodmap -e 'clear Lock' &
xmodmap -e 'clear mod1' &
xmodmap -e 'add mod1 = Alt_L Meta_L' &
