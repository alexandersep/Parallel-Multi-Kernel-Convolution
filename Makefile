# Compiler used
CC=gcc

# C Flags
CFLAGS=-O3 -msse4 -Wall -Werror

# OpenMP flag
OPENMP=-fopenmp

# pthread flag
PTHREAD=-pthread

# Executable Name
EXEC_OPENMP=conv-openmp
EXEC_PTHREAD=conv-pthread

# Default Executable when run with "make" 
.DEFAULT_GOAL: $(EXEC_OPENMP)

COMMAND=100 100 5 5 5

# Openmp command
$(EXEC_OPENMP): conv-harness.c
	$(CC) -o $@ conv-harness.c $(CFLAGS) $(OPENMP)

# Pthread command
$(EXEC_PTHREAD): conv-harness.c
	$(CC) -o $@ conv-harness.c $(CFLAGS) $(PTHREAD)

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

