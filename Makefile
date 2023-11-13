EXE = ADRouter

.PHONY: build
build: cmake-build
	cd build && make

.PHONY: cmake-build
cmake-build:
	mkdir -p build
	cd build && cmake -DCMAKE_BUILD_TYPE=debug ..

PHONY: cmake-release
cmake-release:
	mkdir -p build
	cd build && cmake -DCMAKE_BUILD_TYPE=release .. && make

.PHONY: clean
clean:
	cd build && make clean

.PHONY: clean_out
clean_out:
	rm outputs/*

.PHONY: flake8
flake8:
	$@