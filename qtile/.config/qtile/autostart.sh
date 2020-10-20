#!/bin/sh

nitrogen --restore &
xmodmap ~/.Xmodmap &
xmodmap -e 'clear lock' &

