# NOTE: on MacOS you need to add an addition flag: -undefined dynamic_lookup
PYTHON ?= python3
PYTHON_CONFIG ?= python3-config
NVCC ?= nvcc

default:
	c++ -O3 -Wall -shared -std=c++11 -fPIC $$($(PYTHON) -m pybind11 --includes) src/simple_ml_ext.cpp -o src/simple_ml_ext.so

cuda:
	$(NVCC) -O3 -std=c++14 --shared -Xcompiler -fPIC $$($(PYTHON) -m pybind11 --includes) src/simple_ml_cuda.cu -o src/simple_ml_cuda$$($(PYTHON_CONFIG) --extension-suffix)
