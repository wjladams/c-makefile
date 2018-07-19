CC      = gcc
CFLAGS  = -g
RM      = rm -f
SRC	= $(wildcard src/*.c)
INC = -Iinclude
OBJS	= $(patsubst src/%.c, obj/%.o, $(SRC))
BIN = hello
MKDIR_SAFE = mkdir -p


all: main

main: obj $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $(BIN)

obj:
	$(MKDIR_SAFE) obj

obj/%.o:src/%.c
	$(CC) $(CFLAGS) $(INC) -c $< -o $@

vars:
	echo $(SRC)
	echo $(OBJS)

clean:
	$(RM) $(OBJS) $(BIN)
