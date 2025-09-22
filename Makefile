APP_NAME := app
BUILD_DIR := src/build
SRC_DIR := src
OBJ_DIR := $(BUILD_DIR)/obj

CXX := clang++
CF := $(shell tr '\n' ' ' < compile_flags.txt)
CXXFLAGS := $(CF) -Wall -Wextra -Werror -Wconversion -Wshadow -g
INCLUDES := -I/opt/homebrew/include -I$(SRC_DIR)
LDFLAGS := -L/opt/homebrew/lib -Wl,-rpath,/opt/homebrew/lib
LIBS := -lglfw -framework OpenGL -framework Cocoa -framework IOKit -framework CoreVideo

SOURCES := $(shell find $(SRC_DIR) -name '*.cpp')
OBJECTS := $(patsubst $(SRC_DIR)/%.cpp,$(OBJ_DIR)/%.o,$(SOURCES))

.PHONY: all build run clean dirs

all: build

dirs:
	@mkdir -p $(OBJ_DIR) $(BUILD_DIR)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp | dirs
	$(CXX) $(CXXFLAGS) $(INCLUDES) -c $< -o $@

build: $(OBJECTS) | dirs
	$(CXX) $(CXXFLAGS) $(OBJECTS) $(LDFLAGS) $(LIBS) -o $(BUILD_DIR)/$(APP_NAME)

run: build
	./$(BUILD_DIR)/$(APP_NAME)

clean:
	rm -rf $(BUILD_DIR)
