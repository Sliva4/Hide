MODPATH="${0%/*}"
. $MODPATH/common_func.sh

cat old.prop > module.prop

if $ROM; then
    for PROP in $(resetprop | grep -oE 'ro.*.build.tags'); do
        resetprop_if_diff $PROP release-keys
    done
    for PROP in $(resetprop | grep -oE 'ro.*.build.type'); do
        resetprop_if_diff $PROP user
    done
fi