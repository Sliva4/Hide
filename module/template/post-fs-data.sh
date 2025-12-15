cat old.prop > module.prop
rm -f zygisk_check
chmod +x monitor
./monitor status "Waiting for zygisk module..."