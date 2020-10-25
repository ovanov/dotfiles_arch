#!/bin/sh

nitrogen --restore &
picom &
xmodmap ~/.Xmodmap &
xmodmap -e 'clear lock' &
xmodmap -e 'clear Mod1' &
xmodmap -e 'add Mod1 = Alt_L Meta_L' &
