#!/bin/bash
# Remove Clangs
rm -rf prebuilts/clang/host/linux-x86
# Repo Init
repo init -u https://github.com/RoraaaAisyy/lmodroid_manifest.git -b fourteen --git-lfs
/opt/crave/resync.sh || repo sync
# cloning trees
git clone https://github.com/RoraaaAisyy/android_device_xiaomi_earth.git -b Lmodroid-14 device/xiaomi/earth
git clone https://github.com/mt6768-dev/proprietary_vendor_xiaomi_earth.git -b lineage-21 vendor/xiaomi/earth
git clone https://github.com/mt6768-dev/android_kernel_xiaomi_earth.git -b lineage-22.2 kernel/xiaomi/earth
git clone https://github.com/LineageOS/android_hardware_xiaomi.git -b lineage-21 hardware/xiaomi
git clone https://github.com/LineageOS/android_hardware_mediatek.git -b lineage-21 hardware/mediatek
git clone https://github.com/LineageOS/android_device_mediatek_sepolicy_vndr.git -b lineage-21 device/mediatek/sepolicy_vndr
git clone https://github.com/AbuRider/signing_keys.git -b lmaodroid vendor/lmodroid-priv/keys 
# Export
export BUILD_USERNAME=aisy
export BUILD_HOSTNAME=pangokceria
export TZ=Asia/Jakarta
# Start Build !
. build/envsetup.sh
breakfast earth userdebug
mka bacon -j$(nproc --all)
