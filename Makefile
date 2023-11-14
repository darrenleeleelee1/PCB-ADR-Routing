EXE = ADRouter


.PHONY: build
build:
	cd build && make -j8

.PHONY: cmake-build-verbose
verbose:
	cd build && cmake -DCMAKE_BUILD_TYPE=Verbose .. && make -j8

.PHONY: cmake-build-debug
cmake-build:
	mkdir -p build
	cd build && cmake -DCMAKE_BUILD_TYPE=Debug .. && make -j8


.PHONY: cmake-build-release
cmake-release:
	mkdir -p build
	cd build && cmake -DCMAKE_BUILD_TYPE=Release .. && make -j8

.PHONY: clean
clean:
	cd build && make clean

.PHONY: clean_out
clean_out:
	rm outputs/*

.PHONY: clang-format
clang-format:
	find . -name '*.cpp' -or -name '*.hpp' | xargs clang-format -i --style=file

.PHONY: flake8
flake8:
	$@