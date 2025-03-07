#!/bin/bash

kill $(pidof xfce4-panel)
xfce4-panel &
xfwm4 --replace &
xfdesktop &

disown
