all: run
build:
	@cargo build --target=aarch64-linux-android --release
	@cp target/aarch64-linux-android/release/zhd .
run: build
	@./zhd
clean:
	@rm zhd
full-clean: clean
	@cargo clean
compiler:
	export PATH="../aarch64-linux-android-4.9-toolchain/bin:$PATH"
actions: compiler build
