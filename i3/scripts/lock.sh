#!/bin/sh
#

img=/usr/share/endeavouros/backgrounds/endeavouros_wallpaper.png

scrot -o $img
convert $img -scale 10% -scale 1000% $img
i3lock -u -i $img
