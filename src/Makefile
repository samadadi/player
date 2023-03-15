SRC := $(wildcard *.c)
OBJ := $(SRC:.c=.o)

all: $(OBJs)

%.o: %.c
	$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ -c $<
