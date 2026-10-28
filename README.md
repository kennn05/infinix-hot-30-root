# Infinix Hot 30 Root

Backup of the ROOT folder used to root the Infinix Hot 30 (X6831, Android 13) with Magisk 26.3, after the 2026-10-29 rebuilds.

## Contents
- magisk_patched-26300_GNWPX.img â patched boot image (32 MB), flashed to boot_a
- vbmeta.img â vbmeta (4 KB), flashed to vbmeta_a
- Magisk.v26.3.apk â Magisk 26.3 installer
- build.prop â device build.prop
- bloatware-removed.txt â current debloat list (73 packages, pm uninstall --user 0)
- bloatware-removed.txt.bak / bloatware-removed-75.bak â earlier debloat lists
- root.sh â ORIGINAL script from the laptop, kept for reference only

## WARNING â do NOT run root.sh blindly
root.sh is the old version and has two bugs:
1. It includes a bootloader unlock step â the bootloader was already unlocked, and re-running unlock risks another factory wipe. Skip the unlock step.
2. Its vbmeta line uses --disable-verification twice and misses --disable-verity. Correct form:
   fastboot flash vbmeta_a --disable-verity --disable-verification vbmeta.img

## Correct flash sequence used
- fastboot flash boot_a magisk_patched-26300_GNWPX.img
- fastboot flash vbmeta_a --disable-verity --disable-verification vbmeta.img
- fastboot reboot
- Install Magisk.v26.3.apk, verify Installed 26.3, Ramdisk Yes, slot _a

## Never debloat again
- com.google.android.modulemetadata â removing it breaks boot (system_server crash, boot loop, proven 2026-10-29)
- com.transsion.powercenter, com.transsion.batterylab, com.transsion.batterylab.icon â kept by choice
- No Magisk modules: Kreapic disable thermal caused a boot hang; Friday's RedMagic / DisableThermal / AntiBootloop builds were dropped by Ken
