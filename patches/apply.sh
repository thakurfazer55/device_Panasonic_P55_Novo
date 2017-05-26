 #!/bin/bash
 cd ../../../..
 cd system/core
 patch -p1 < ../../device/Xiaomi/hm_note_1w/patches/core.patch
 cd ../..
 cd packages/apps/Settings
 patch -p1 < ../../device/Xiaomi/hm_note_1w/patches/author_info.patch
 cd ../../..
 cd system*/bt
 patch -p1 < ../../device/Xiaomi/hm_note_1w/patches/bt.patch
 cd ..
 cd net*
 patch -p1 < ../../device/Xiaomi/hm_note_1w/patches/netd2.patch
 patch -p1 < ../../device/Xiaomi/hm_note_1w/patches/netd1.patch
 cd ..
 cd vo*
 patch -p1 < ../../device/Xiaomi/hm_note_1w/patches/vold.patch
 cd ../..
 cd frame*/av
 patch -p1 < ../../device/Xiaomi/hm_note_1w/patches/av.patch
 cd ..
 cd base
 patch -p1 < ../../device/Xiaomi/hm_note_1w/patches/base.patch
 cd ..
 cd rs
 patch -p1 < ../../device/Xiaomi/hm_note_1w/patches/rs.patch
 cd ..
 cd native
 patch -p1 < ../../device/Xiaomi/hm_note_1w/patches/native.patch
 cd ..
 cd opt/te*/
 patch -p1 < ../../device/Xiaomi/hm_note_1w/patches/telephony.patch
 cd ../../..
 cd exte*/sepolicy
 patch -p1 < ../../device/Xiaomi/hm_note_1w/patches/sepolicy.patch
 cd ..
 cd wpa*
 patch -p1 < ../../device/Xiaomi/hm_note_1w/patches/wpa.patch
 cd ../..
 echo Patches Applied Successfully!
