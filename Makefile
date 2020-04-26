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

sample1: sample1.o display.o shader.o mesh.o
	$(CC) $(CPPFLAGS) -o $(BUILD)/sample1 $(OBJ)/mesh.o $(OBJ)/shader.o $(OBJ)/display.o $(OBJ)/sample1.o $(OPENGL)

sample1.o: samples/sample1.cpp
	$(CC) $(CPPFLAGS) -c samples/sample1.cpp -o $(OBJ)/sample1.o $(OPENGL) -Isrc

mesh.o: $(SRC)/mesh.cpp
	$(CC) $(CFLAGS) -c $(SRC)/mesh.cpp -o $(OBJ)/mesh.o $(OPENGL)

shader.o: $(SRC)/shader.cpp
	$(CC) $(CFLAGS) -c $(SRC)/shader.cpp -o $(OBJ)/shader.o $(OPENGL)

display.o: src/display.cpp
	$(CC) $(CFLAGS) -c $(SRC)/display.cpp -o $(OBJ)/display.o $(OPENGL)
