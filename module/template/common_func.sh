SUSFS_BIN=/data/adb/ksu/bin/ksu_susfs

VBMETA=false
$MODPATH/zh config get rom | grep -q true
[ $? -eq 0 ] && VBMETA=true

ROM=false
$MODPATH/zh config get rom | grep -q true
[ $? -eq 0 ] && ROM=true

MODE=1
$MODPATH/zh config get mode | grep -q 2
[ $? -eq 0 ] && MODE=2


SUSFS=false
[ -f "$SUSFS_BIN" ] && SUSFS=true

if [ $MODE -eq 2 ]; then
SUSFS=false
VBMETA=false
ROM=false
fi

# sus_mount <mount name>
sus_mount() {
    local NAME="$1"
    $SUSFS_BIN add_sus_mount $NAME
}

# resetprop_if_diff <prop name> <expected value>
resetprop_if_diff() {
    local NAME="$1"
    local EXPECTED="$2"
    local CURRENT="$(resetprop "$NAME")"

    [ -z "$CURRENT" ] || [ "$CURRENT" = "$EXPECTED" ] || resetprop -n "$NAME" "$EXPECTED"
}

# resetprop_if_match <prop name> <value match string> <new value>
resetprop_if_match() {
    local NAME="$1"
    local CONTAINS="$2"
    local VALUE="$3"

    [[ "$(resetprop "$NAME")" = *"$CONTAINS"* ]] && resetprop -n "$NAME" "$VALUE"
}

# delprop_if_exist <prop name>
delprop_if_exist() {
    local NAME="$1"

    [ -n "$(resetprop "$NAME")" ] && resetprop --delete "$NAME"
}
