#! /bin/sh

#########################
# INSTRUCTIONS
#########################

# 1. Copy this file to ~/.local/bin/powermenu
# 2. then change permission of powermenu file to executable
# i.e sudo chmod +e ~/.local/bin/powermenu
# 
# 3. Test powermenu command in your terminal to see if it open rofi powermenu options

##########################


chosen=$(printf "  Power Off\n  Restart\n  Lock" | rofi -dmenu -i -theme-str '@import "power.rasi"')

case "$chosen" in
	"  Power Off") poweroff ;;
	"  Restart") reboot ;;
	"  Lock") slock ;;
	*) exit 1 ;;
esac
