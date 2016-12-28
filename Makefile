
SRC=$(wildcard *.asm)

TAPDIR=out

$(TAPDIR):
	mkdir $(TAPDIR)

tapes=$(addprefix $(TAPDIR)/, draw-line.tap)

all: $(TAPDIR) $(tapes)

clean:
	rm -rf $(TAPDIR)

$(tapes): $(SRC)
	pasmo --tapbas $< $@
