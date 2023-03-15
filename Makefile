export CPPFLAGS := $(addprefix -I, $(dir $(shell find $(CURDIR) -name *.h)))
export CFLAGS := -Wall -std=c99 $(shell pkg-config --cflags libadwaita-1)
export LDLIBS := $(shell pkg-config --libs libadwaita-1)

SRC = src
BIN = player
BINDIR := $(PREFIX)/bin
MKFs := $(shell find $(SRC) -name "Makefile")
SRCs := $(shell find $(SRC) -name "*.c")
OBJs := $(SRCs:.c=.o)

all: $(BIN)

run: $(BIN)
	$(abspath $(BIN))

install: $(BIN)
	mkdir -p $(BINDIR)
	install $(BIN) $(BINDIR)/$(BIN)

$(BIN): $(MKFs) $(OBJs)
	$(CC) $(CFLAGS) $(CPPFLAGS) -o $(BIN) $(shell find $(CURDIR) -name "*.o") $(LDFLAGS) $(LDLIBS)

$(MKFs): $(SRCs)
	$(MAKE) -C $(dir $@)

clean:
	$(RM) -R $(BIN)
	$(RM) -R $(shell find $(SRC) -name "*.o")
