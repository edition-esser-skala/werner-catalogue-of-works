# use this instead of tabs for marking recipe lines
.RECIPEPREFIX = >

# invocation of LilyPond
LILYPOND = lilypond \
  --include=$(EES_TOOLS_PATH) \
  --include=$(realpath data/incipits) \
  --png \
  -dno-point-and-click \
  -dcrop

# invocation of Verovio
VEROVIO = verovio \
  --adjust-page-height \
  --adjust-page-width \
  --header "none" \
  --footer "none" \
  --page-margin-bottom 0 \
  --page-margin-left 0 \
  --page-margin-right 0 \
  --page-margin-top 0 \
  --scale 33

# all LY files in data/incipits (except header.ly), e.g. data/incipits/Q_2/main.ly
SOURCES_LY := $(shell find data/incipits -type f -name "*.ly" -and -not -name "header.ly")

# names of PNG files to be engraved, e.g. incipits/Q_2/main.png
TARGETS_LY := $(SOURCES_LY:data/%.ly=%.png)

# names of low-resolution PNG files, e.g. incipits/Q_2/main_low.png
TARGETS_LY_LOW := $(TARGETS_LY:.png=_low.png)

# all MEI files in data/incipits, e.g. data/incipits/B_46/main.mei
SOURCES_MEI := $(shell find data/incipits -type f -name "*.mei")

# names of SVG files to be engraved, e.g. incipits/B_46/main.svg
TARGETS_MEI := $(SOURCES_MEI:data/%.mei=%.svg)

# execute all recipe lines in a single shell,
# since we use variables in the recipes
.ONESHELL:

# default target: engrave all LY files
all: $(TARGETS_LY) $(TARGETS_LY_LOW) $(TARGETS_MEI)

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

# how to engrave SVGs from MEI
$(TARGETS_MEI): incipits/%.svg: data/incipits/%.mei
>mkdir -p $(@D)
>$(VEROVIO) -o $@ $<
