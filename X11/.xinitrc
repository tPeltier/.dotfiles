
# .Xresrouces has the colors for URxvt in it
xrdb -merge ~/.config/X11/.Xresources

# URxvt Daemon
urxvtd -o -q -f

# Start i3
exec i3
