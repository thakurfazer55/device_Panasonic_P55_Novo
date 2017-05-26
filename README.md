This is a Device tree for Redmi Note 3G (MT6592) which is based on MT6592 SoC.
Based on Stock Kitkat kernel (3.4.67)


# Specifications:-
   * CPU	Octa-core 1.4/1.7 GHz Cortex-A7 
   * Memory	2GB RAM
   * Android Version 4.4.2 
   * Storage	8GB
   * Battery	3150 mAh
   * Display	5.5" 720 x 1280 DPI 320
   * Rear Camera	13MP
   * Front Camera	5MP


# Working
  * 2G/3G Switch
  * Data Working (No need to Reboot)
  * Dual SIM
  * Wifi
  * VPN
  * Bluetooth
  * Audio
  * Sensors
  * Camera (photo and video recording)
  * GPS
  * Screen Record
  * HD games
  * Tethering (Wifi, Bluetooth and USB)

# Bugs
  * VPN

# Build

  * repo init -u git://github.com/LineageOS/android.git -b cm-13.0
  * repo sync
  * git clone https://github.com/EndLess728/android_device_hm_note_1w.git -b master device/Xiaomi/hm_note_1w
  * git clone https://github.com/EndLess728/android_vendor_hm_note_1w.git -b master vendor/Xiaomi/hm_note_1w
  * cd device/Xiaomi/hm_note_1w/patches
  * . apply.sh 
  * source build/envsetup.sh
  * breakfast hm_note_1w
  * brunch hm_note_1w
  * Done :)
  
  # Credits/Thanks to:-
  * Fire855
  * Axet
  * chrmhoffmann
  * DerTeufel1980
  * Al3XKOoL
  * xen0n
  * kashifmin
  * Santhosh M
  * ariafan
  * hyperion70
  * CyanogenMod Team
  * Tirth Patel
  * Kishan Patel
  * Yazad Madan
  * Tribetmen (2G/3G Switch and Reboot to turn On data Fix)
  * SamarV-121
  * EndLess
