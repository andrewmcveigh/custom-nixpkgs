#!/run/current-system/sw/bin/sh
/run/current-system/sw/bin/env

if which spotify
then
    dbus-send --print-reply \
              --dest=org.mpris.MediaPlayer2.spotify \
              /org/mpris/MediaPlayer2 \
              org.mpris.MediaPlayer2.Player.Pause
fi

killall hhpc
xset -display :0.0 dpms force off
read ans
if [ -n "$WRAPPER_DIR" ]
then
    $WRAPPER_DIR/slock
else
    slock
fi
hhpc -i 3 &
xset -display :0.0 dpms force on
