CC = g++
CPPFLAGS = -std=c++17 -Wall
OPENGL = -lGL -lGLEW -lSDL2
OBJ = obj
BUILD = build

all: $(BUILD) $(OBJ) samples

$(BUILD):
	mkdir -p $@

$(OBJ):
	mkdir -p $@

samples: sample1
	$(BUILD)/sample1

sample1: sample1.o
	$(CC) $(CPPFLAGS) -o $(BUILD)/sample1 $(OBJ)/display.o obj/sample1.o $(OPENGL)

sample1.o: display.o
	$(CC) $(CPPFLAGS) -c samples/sample1.cpp -o $(OBJ)/sample1.o $(OPENGL) -Isrc

display.o: src/display.cpp
	$(CC) $(CFLAGS) -c src/display.cpp -o $(OBJ)/display.o $(OPENGL)
