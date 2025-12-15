all: run
build:
	@cargo build --target=aarch64-linux-android --release
	@cp target/aarch64-linux-android/release/zhd .
run: build
	@./zhd
clean:
	@rm -f zhd
full-clean: clean
	@cargo clean