# Compiler
CC = g++

# Project Name
PROJECT = project1

DATA = ../data/

DEST = ../bin/

# OpenCV Libraries (pkg-config)
LIBS = `pkg-config --cflags --libs opencv4`

# Compile and Link
TASK = test_video

# $(PROJECT): $(TASK).cpp
# 	$(CC) -o $(DEST)$(TASK).exe $(TASK).cpp $(LIBS)

$(PROJECT): $(TASK).cpp
	$(DEST)$(TASK).exe $(DATA)$(TASK).mp4 $(TASK)

# # Compile and Link
# $(PROJECT): $(PROJECT).cpp
# 	$(CC) -o $(DEST)$(PROJECT).exe $(SRC) $(LIBS)

# $(PROJECT): $(PROJECT).cpp
# 	$(DEST)$(PROJECT).exe $(DATA)$(PROJECT).mp4 $(PROJECT)

# # Compile and Link
# $(PROJECT): $(PROJECT).cpp
# 	$(CC) -o $(DEST)$(PROJECT).exe $(SRC) $(LIBS)

# $(PROJECT): $(PROJECT).cpp
# 	$(DEST)$(PROJECT).exe $(DATA)$(PROJECT).mp4 $(PROJECT)

# # Compile and Link
# $(PROJECT): $(PROJECT).cpp
# 	$(CC) -o $(DEST)$(PROJECT).exe $(SRC) $(LIBS)

# $(PROJECT): $(PROJECT).cpp
# 	$(DEST)$(PROJECT).exe $(DATA)$(PROJECT).mp4 $(PROJECT)