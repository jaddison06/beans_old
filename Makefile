.PHONY: codegen

all: codegen libraries

libraries: build/native/SDL/libSDLEvent.so build/native/SDL/libSDLDisplay.so

codegen:
	python codegen/main.py

run: all
	dart run

clean:
	rm -rf build
	rm -f native/c_codegen.h
	rm -f bin/dart_codegen.dart

cloc:
	cloc . --exclude-list=.cloc_exclude_list.txt

cloc-by-file:
	cloc . --exclude-list=.cloc_exclude_list.txt --by-file

build/native/SDL/libSDLEvent.so: native/SDL/SDLEvent.c
	mkdir -p build/native/SDL
	gcc -shared -o build/native/SDL/libSDLEvent.so -fPIC -I. native/SDL/SDLEvent.c -lSDL2

build/native/SDL/libSDLDisplay.so: native/SDL/SDLDisplay.c
	mkdir -p build/native/SDL
	gcc -shared -o build/native/SDL/libSDLDisplay.so -fPIC -I. native/SDL/SDLDisplay.c -lSDL2

