#!/bin/bash

kill $(pidof xfce4-panel)
xfce4-panel &
disown

xfwm4 --replace &
