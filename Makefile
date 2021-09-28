.PHONY: codegen

all: codegen libraries

libraries: build/native/libTest.so

codegen:
	python codegen/main.py

run: all
	dart run

clean:
	rm -rf build
	rm -f native/c_codegen.h
	rm -f native/c_codegen.h

cloc:
	cloc . --exclude-list=.cloc_exclude_list.txt

cloc-by-file:
	cloc . --exclude-list=.cloc_exclude_list.txt --by-file

build/native/libTest.so: native/Test.c
	mkdir -p build/native
	gcc -shared -o build/native/libTest.so -fPIC -I. native/Test.c

