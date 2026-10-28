echo "ROOTING YOUR INFINIX HOT 30.."
sleep 2
adb devices
read -p "PRESS TO CONTINUE..."
adb reboot bootloader
read -p "PRESS TO CONTINUE..."
fastboot flashing unlock
read -p "PRESS TO CONTINUE..."
fastboot flash boot magisk_patched-26300_GNWPX.img
read -p "PRESS TO CONTINUE..."
fastboot --disable-verification --disable-verification flash vbmeta vbmeta.img
read -p "PRESS TO CONTINUE..."
fastboot reboot
echo "YOUR PHONE IS SUCCESSFULLY ROOTED. REBOOTING YOUR PHONE , PLEASE WAIT..."
