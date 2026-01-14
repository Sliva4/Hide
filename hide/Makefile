CC := aarch64-linux-android29-clang
CC_ARGS := -flto -O3 -I .
all: build
clean:
	@rm -rf build
	@echo /dev/null > res.h
build-folder:
	@mkdir build
configure: build-folder
	@xxd -i module.temp > res.h
str.o:
	@echo "CC str.o"
	@$(CC) -c str.c $(CC_ARGS) -o build/str.o
main.o: str.o
	@echo "CC main.o"
	@$(CC) -c main.c $(CC_ARGS) -o build/main.o
build: clean configure main.o
	@echo "LD hide"
	@$(CC) build/*.o $(CC_ARGS) -o build/hide
run: build
	@build/hide