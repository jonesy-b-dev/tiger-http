SRC := $(wildcard ./source/*.cpp)
OUTDIR := build
OUTNAME := tigerHttp
CFLAGS = -Wall

DEBUG ?= 0

ifeq ($(DEBUG), 1)
    CFLAGS += -g

# Run in gdb when debugging is on
run: $(OUTNAME)
	gdb $(OUTDIR)/$(OUTNAME)

# Else just run the program
else
run: $(OUTNAME)
	$(OUTDIR)/$(OUTNAME)
endif

$(OUTNAME): $(SRC) $(OUTDIR)
	g++ $(CFLAGS) -o $(OUTDIR)/$@ $(SRC)

$(OUTDIR):
	mkdir -p $(OUTDIR)

clean:
	rm -rf build/.
