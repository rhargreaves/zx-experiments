
SRC = $(wildcard *.asm)
BASIC_SRC = $(wildcard *.bas)
TAPES = $(patsubst %.asm,$(TAPDIR)/%.tap,$(SRC))
BASIC_TAPES = $(patsubst %.bas,$(TAPDIR)/%.tap,$(BASIC_SRC))
PASMO = docker run -v $(PWD):/work -w="/work" -it charlottegore/pasmo pasmo
TAPDIR = out

.PHONY: all clean test

all: $(TAPES) $(BASIC_TAPES) $(TAPDIR)
$(TAPDIR):
	mkdir $(TAPDIR)

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
