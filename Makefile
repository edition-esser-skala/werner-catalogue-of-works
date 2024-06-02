# use this instead of tabs for marking recipe lines
.RECIPEPREFIX = >

# invocation of LilyPond
LILYPOND = lilypond \
  --include=$(EES_TOOLS_PATH) \
  --include=$(realpath data/incipits) \
  --png \
  -dno-point-and-click \
  -dcrop

# all LY files in data/incipits (except header.ly), e.g. data/incipits/Q_2/main.ly
SOURCES_LY := $(shell find data/incipits -type f -name "*.ly" -and -not -name "header.ly")

# names of PNG files to be engraved, e.g. incipits/Q_2/main.png
TARGETS_LY := $(SOURCES_LY:data/%.ly=%.png)

# names of low-resolution PNG files, e.g. incipits/Q_2/main_low.png
TARGETS_LY_LOW := $(TARGETS_LY:.png=_low.png)

# execute all recipe lines in a single shell,
# since we use variables in the recipes
.ONESHELL:

# default target: engrave all LY files
all: $(TARGETS_LY) $(TARGETS_LY_LOW)

# how to engrave high-res PNGs from LY
$(TARGETS_LY): incipits/%.png: data/incipits/%.ly data/incipits/header.ly
>mkdir -p $(@D)
>target_name=$(basename $@ .png)
>$(LILYPOND) -dresolution=300 -o $${target_name} $<
>mv $${target_name}.cropped.png $${target_name}.png

# how to engrave low-res PNGs from LY
$(TARGETS_LY_LOW): incipits/%_low.png: data/incipits/%.ly data/incipits/header.ly
>target_name=$(basename $@ .png)
>$(LILYPOND) -dresolution=150 -o $${target_name} $<
>mv $${target_name}.cropped.png $${target_name}.png
