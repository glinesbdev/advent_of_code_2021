CXX = clang++
CXXFLAGS = -Wall -std=c++17
RM = rm -rf

all: solution

solution:
	@mkdir -p build
	$(CXX) $(CXXFLAGS) $@.cpp -o build/$@

clean:
	$(RM) build

run: solution
	./build/$<

PHONY: all clean run
