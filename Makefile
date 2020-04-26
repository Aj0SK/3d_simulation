CC = g++
CPPFLAGS = -std=c++17 -Wall
OPENGL = -lGL -lGLEW -lSDL2
OBJ = obj
BUILD = build
SRC = src

all: $(BUILD) $(OBJ) samples

$(BUILD):
	mkdir -p $@

$(OBJ):
	mkdir -p $@

samples: sample1
	$(BUILD)/sample1

sample1: sample1.o
	$(CC) $(CPPFLAGS) -o $(BUILD)/sample1 $(OBJ)/shader.o $(OBJ)/display.o $(OBJ)/sample1.o $(OPENGL)

sample1.o: display.o
	$(CC) $(CPPFLAGS) -c samples/sample1.cpp -o $(OBJ)/sample1.o $(OPENGL) -Isrc

shader.o: $(SRC)/shader.cpp
	$(CC) $(CFLAGS) -c $(SRC)/shader.cpp -o $(OBJ)/shader.o $(OPENGL)

display.o: src/display.cpp
	$(CC) $(CFLAGS) -c $(SRC)/display.cpp -o $(OBJ)/display.o $(OPENGL)
