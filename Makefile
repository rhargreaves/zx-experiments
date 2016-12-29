
SRC = $(wildcard *.asm)

TAPDIR = out

$(TAPDIR):
	mkdir $(TAPDIR)

tapes = $(patsubst %.asm,$(TAPDIR)/%.tap,$(SRC))

all: $(TAPDIR) $(tapes)

clean:
	rm -rf $(TAPDIR)

$(TAPDIR)/%.tap: %.asm
	@echo $<
	pasmo --tapbas $< $@
