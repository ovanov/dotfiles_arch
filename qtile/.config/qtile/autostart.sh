#!/bin/bash

nitrogen --restore &
picom &
xmodmap ~/.Xmodmap &
xmodmap -e 'clear lock' &

