MODPATH="${0%/*}"
. $MODPATH/common_func.sh

if $VBMETA; then
    resetprop_if_diff "ro.boot.vbmeta.avb_version" "1.2"
    resetprop_if_diff "ro.boot.vbmeta.hash_alg" "sha256"
    resetprop_if_diff "ro.boot.vbmeta.size" "4096"
fi

if $SUSFS; then
    sus_mount "/system/usr/keylayout"
    sus_mount "/system/xbin"
fi

delprop_if_exist "ro.build.selinux"

$MODPATH/zh boot-completed