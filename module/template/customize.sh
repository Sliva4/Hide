echo "Path: $MODPATH"
cd $MODPATH
sha256sum -c sha256
rm -f sha256
chmod +x zh
if [ $? -eq 0 ]; then
    ui_print "All checksums matched successfully."
    touch sha256ok
else
    ui_print "Some checksums failed or an error occurred."
fi
ui_print "Welcome to ZygiskHide!"