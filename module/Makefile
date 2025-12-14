all: build zip-all
build:
	ndk-build
zip-all:
	mv libs/arm64-v8a/libZygiskHide.so template/zygisk/arm64-v8a.so
	mv libs/armeabi-v7a/libZygiskHide.so template/zygisk/armeabi-v7a.so
	zip -r9 ZygiskHide.zip template/module.prop template/zygisk/arm64-v8a.so template/zygisk/armeabi-v7a.so
clean:
	rm -rf libs
	rm ZygiskHide.zip
