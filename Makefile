# By ChatGPT 4o mini.
# Prompt: In my C++ project, the root directory has an main.cpp file, including main function. The main function include a function from src/hw.cpp, defined in src/hw.h. Help me to write a Makefile to compile this project.

# Compiler
CXX = g++
# Compiler flags
CXXFLAGS = -Wall -Wextra -std=c++11
# Directories
SRC_DIR = src
OBJ_DIR = obj
# Source files
SRCS = main.cpp $(SRC_DIR)/hw.cpp
# Object files
OBJS = $(patsubst %.cpp,$(OBJ_DIR)/%.o,$(SRCS))
# Output binary
TARGET = main

# Default target
all: $(TARGET)

# Link the object files to create the binary
$(TARGET): $(OBJS)
	$(CXX) -o $@ $^

# Compile source files into object files
$(OBJ_DIR)/%.o: %.cpp
	mkdir -p $(dir $@)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Clean up build files
clean:
	rm -rf $(OBJ_DIR) $(TARGET)

.PHONY: all clean
