FILES := hide common_func.sh service.sh customize.sh post-fs-data.sh old.prop module.prop zygisk/arm64-v8a.so
ZIP_NAME := ZygiskHide.zip
all: build-module
build-module: configure-template copy-module-prop build-hide copy-hide build-zygisk copy-zygisk-files hash zip-all
build-zygisk:
	@cd module && ndk-build && cd ..
copy-zygisk-files: 
	@mv module/libs/arm64-v8a/libZygiskHide.so module/template/zygisk/arm64-v8a.so
build-hide:
	@cd hide && make && cd ..
copy-hide:
	@cp hide/build/hide module/template/
copy-module-prop:
	@cp module/template/module.prop hide/
	@mv hide/module.prop hide/module.temp
hash:
	@for f in $(FILES); do \
		cd module/template; \
		sha256sum $$f >> sha256; \
		cd ..; \
		cd ..; \
	done
zip-all:
	@cd module/template && zip -r9 $(ZIP_NAME) $(FILES) sha256 && mv $(ZIP_NAME) .. && cd .. && cd ..
configure-template:
	@cat module/template/module.prop > module/template/old.prop
clean:
	@cat /dev/null > module/template/old.prop
	@rm -rf module/libs
	@rm -rf module/template/zygisk/arm64-v8a.so
	@rm -f module/$(ZIP_NAME)
	@cat /dev/null > module/template/sha256
	@rm -f module/template/hide