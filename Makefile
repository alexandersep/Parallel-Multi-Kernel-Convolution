# Compiler used
CC=gcc

# C Flags
CFLAGS=-O3 -msse4 -Wall -Werror

# OpenMP flag
OPENMP=-fopenmp

# pthread flag
PTHREAD=-pthread

# Default command testing on
COMMAND=100 100 5 5 5

# Name of Executables
EXEC_OPENMP=conv-openmp
EXEC_PTHREAD=conv-pthread

# Operating System name
UNAME=$(shell uname)

# Non Recursive Assignments
# If Linux bin file
ifeq ($(UNAME), Linux)
EXEC_OPENMP:=$(EXEC_OPENMP).bin
EXEC_PTHREAD:=$(EXEC_PTHREAD).bin
else # Else Windows exe file
EXEC_OPENMP:=$(EXEC_OPENMP).exe
EXEC_PTHREAD:=$(EXEC_PTHREAD).exe
endif

# Default Executable when run with "make" 
.DEFAULT_GOAL: $(EXEC_OPENMP)

# Openmp command
$(EXEC_OPENMP): conv-harness.c
	$(CC) -o $@ conv-harness.c $(CFLAGS) $(OPENMP)

# Pthread command
$(EXEC_PTHREAD): conv-harness.c
	$(CC) -o $@ conv-harness.c $(CFLAGS) $(PTHREAD)

all: $(EXEC_OPENMP) $(EXEC_PTHREAD)

# Run with specified flags
run: 
	@if [ -f ./$(EXEC_OPENMP) ]; then \
		echo "Executing:" $(EXEC_OPENMP); \
		./$(EXEC_OPENMP) $(COMMAND); \
	elif [ -f ./$(EXEC_PTHREAD) ]; then \
		echo "Executing:" $(EXEC_PTHREAD); \
		./$(EXEC_PTHREAD) $(COMMAND); \
	else \
		echo "No executable found to run."; \
	fi

# Surpress echo of the command using "@" and remove all executables
clean:
	@[ -f ./$(EXEC_OPENMP) ] && rm $(EXEC_OPENMP) || true
	@[ -f ./$(EXEC_PTHREAD) ] && rm $(EXEC_PTHREAD) || true

