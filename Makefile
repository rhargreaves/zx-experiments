
SRC = $(wildcard *.asm)

PASMO = docker run -v $(PWD):/work -w="/work" -it charlottegore/pasmo pasmo

TAPDIR = out

$(TAPDIR):
	mkdir $(TAPDIR)

tapes = $(patsubst %.asm,$(TAPDIR)/%.tap,$(SRC))

all: $(tapes) $(TAPDIR)

clean:
	rm -rf $(TAPDIR)

test: $(tapes)
	fuse --tape $< --auto-load --no-autosave-settings

$(TAPDIR)/%.tap: %.asm
	@echo $<
	$(PASMO) --tapbas $< $@
