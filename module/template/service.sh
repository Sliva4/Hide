chmod +x monitor
while true
do
  if [ -f "/data/adb/modules/zygisk_hide/zygisk_check" ]; then
    ./monitor status "OK"
    break
  fi
  sleep 1
done