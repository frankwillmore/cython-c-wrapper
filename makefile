LIB_DIR = lib

default: pyexamples

pyexamples: setup.py pyexamples.pyx $(LIB_DIR)/libexamples.so
	python3 setup.py build_ext --inplace && rm -f pyexamples.c && rm -Rf build

${LIB_DIR}/libexamples.so:
	make -C $(LIB_DIR) libexamples.so

check:
	export LD_LIBRARY_PATH=${LIB_DIR}:${LD_LIBRARY_PATH} && python -c "import pyexamples; pyexamples.py_hello(b\"world\")"

clean:
	rm -rf *.c *.so build
	make -C $(LIB_DIR) clean
