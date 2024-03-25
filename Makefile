EXE = ADRouter

# or::tools need add -DBUILD_DEPS=ON

.PHONY: build
build:
	cd build && make -j8

.PHONY: cmake-build-verbose
cmake-build-verbose:
	mkdir -p build
	cd build && cmake -DCMAKE_BUILD_TYPE=Verbose .. && make -j8

.PHONY: cmake-build-debug
cmake-build-debug:
	mkdir -p build
	cd build && cmake -DCMAKE_BUILD_TYPE=Debug .. && make -j8


.PHONY: cmake-build-release
cmake-build-release:
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
	find . -name '*.cpp' -or -name '*.hpp' | grep -v '^./build/' | xargs clang-format -i --style=file

.PHONY: flake8
flake8:
	$@

