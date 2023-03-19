# Usage: make # Compiles the programme
# 		 make conv # Another way to compile the programme 
# 		 make run # Runs programme 
# 		 make clean # Removes executable 

# Compiler used
CC=gcc

CFILES=conv-harness.c

# C Flags
CFLAGS=-O3 -msse4 -Wall -Werror -fopenmp -pthread -lm

# Default command testing on
# width, height, kernel order, nchannels pow of 2, nkernels pow of 2 
COMMAND=100 100 5 32 32

# Name of Executables
EXEC=conv

# Operating System name
UNAME=$(shell uname)

# Non Recursive Assignments
# If Windows give .exe  extension else no extension
ifneq ($(UNAME), Linux)
EXEC:=$(EXEC).exe
endif

# Default Executable when run with "make" 
.DEFAULT_GOAL: $(EXEC)

# Openmp command
$(EXEC): $(CFILES) 
	$(CC) -o $@ $(CFILES) $(CFLAGS)

all: $(EXEC)

# Run with specified flags
run: $(EXEC)
	@if [ -f ./$(EXEC) ]; then \
		echo "Executing:" $(EXEC); \
		./$(EXEC) $(COMMAND); \
	else \
		echo ./$(EXEC) "cannot be run because it does not exist"; \
	fi

# Surpress echo of the command using "@" and remove all executables
clean:
	@[ -f ./$(EXEC) ] && rm $(EXEC) || true

