
SRC = $(wildcard *.asm)
BASIC_SRC = $(wildcard *.bas)

PASMO = docker run -v $(PWD):/work -w="/work" -it charlottegore/pasmo pasmo
TAPDIR = out

$(TAPDIR):
	mkdir $(TAPDIR)

tapes = $(patsubst %.asm,$(TAPDIR)/%.tap,$(SRC))
basic_tapes = $(patsubst %.bas,$(TAPDIR)/%.tap,$(BASIC_SRC))

all: $(tapes) $(basic_tapes) $(TAPDIR)

clean:
	rm -rf $(TAPDIR)

test: $(tapes)
	fuse --tape $< --auto-load --no-autosave-settings

$(TAPDIR)/%.tap: %.asm
	@echo $<
	$(PASMO) --tapbas $< $@

$(TAPDIR)/%.tap: %.bas
	@echo $<
	bas2tap/bas2tap $< $@
