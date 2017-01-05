
SRC = $(wildcard src/*.asm)
BASIC_SRC = $(wildcard src/*.bas)
TAPES = $(patsubst src/%.asm,$(TAPDIR)/%.tap,$(SRC))
BASIC_TAPES = $(patsubst src/%.bas,$(TAPDIR)/%.tap,$(BASIC_SRC))
PASMO = docker run -v $(PWD):/work -w="/work" -it charlottegore/pasmo pasmo
TAPDIR = bin

.PHONY: all clean test

all: $(TAPES) $(BASIC_TAPES)

$(TAPDIR):
	mkdir $(TAPDIR)

clean:
	rm -rf $(TAPDIR)

test: $(tapes)
	fuse --tape $< --auto-load --no-autosave-settings

$(TAPDIR)/%.tap: src/%.asm $(TAPDIR)
	@echo $<
	$(PASMO) --tapbas $< $@

$(TAPDIR)/%.tap: src/%.bas $(TAPDIR)
	@echo $<
	bas2tap/bas2tap $< $@
