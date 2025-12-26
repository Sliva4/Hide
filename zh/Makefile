all: run
github-actions: build copy
build:
	@cargo build --target=aarch64-linux-android --release && cp target/aarch64-linux-android/release/zh .
run: build
	@./zh
clean:
	@rm -f module.prop
	@rm -f zh
	@rm -f config.toml
full-clean: clean
	@cargo clean --quiet
build-debug:
	@cargo build --release && cp target/release/zh .
debug:
	@cargo run --release