all: run
github-actions: build copy
build:
	@cargo build --target=aarch64-linux-android --release
	@cp target/aarch64-linux-android/release/monitor .
run: build
	@./monitor
copy:
	@cp monitor ../module/template
clean:
	@rm -f module.prop
	@rm -f monitor
full-clean: clean
	@cargo clean --quiet
debug:
	@cargo run --release