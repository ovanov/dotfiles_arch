#!/bin/sh

nitrogen --restore &
picom &
xmodmap ~/.Xmodmap &
xmodmap -e 'clear lock' &

