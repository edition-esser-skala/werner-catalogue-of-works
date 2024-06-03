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

# all LY files in data/incipits (except header.ly),
# e.g. data/incipits/Q_2/main.ly -> Q_2/main
SOURCES_LY := $(shell find data/incipits -type f -name "*.ly" -and -not -name "header.ly")
SOURCES_LY := $(SOURCES_LY:data/incipits/%.ly=%)

# all MEI files in data/incipits,
# e.g. data/incipits/B_46/main.mei -> B_46/main
SOURCES_MEI := $(shell find data/incipits -type f -name "*.mei")
SOURCES_MEI := $(SOURCES_MEI:data/incipits/%.mei=%)

# all PAE files in data_generated/rism_incipits_pae,
# e.g. data_generated/rism_incipits_pae/A_5/main.pae -> A_5/main
SOURCES_RISM := $(shell find data_generated/rism_incipits_pae -type f -name "*.pae")
SOURCES_RISM := $(SOURCES_RISM:data_generated/rism_incipits_pae/%.pae=%)

# remove incipits for which a manually curated version is available
SOURCES_RISM := $(filter-out $(SOURCES_LY),$(SOURCES_RISM))
SOURCES_RISM := $(filter-out $(SOURCES_MEI),$(SOURCES_RISM))

# names of manually curated incipits to be created by LilyPond,
# e.g. incipits/Q_2/main.png
TARGETS_LY := $(SOURCES_LY:%=incipits/%.png)

# names of corresponding low-resolution PNG files,
# e.g. incipits/Q_2/main_low.png
TARGETS_LY_LOW := $(TARGETS_LY:.png=_low.png)

# names of manually curated incipits to be created by Verovio,
# e.g. incipits/B_46/main.svg
TARGETS_MEI := $(SOURCES_MEI:%=incipits/%.svg)

# names of RISM incipits to be created by Verovio,
# e.g. incipits/A_1_3/main.svg
TARGETS_RISM := $(SOURCES_RISM:%=incipits/%.svg)


# execute all recipe lines in a single shell,
# since we use variables in the recipes
.ONESHELL:

# default target: create all incipits
all: $(TARGETS_LY) $(TARGETS_LY_LOW) $(TARGETS_MEI) $(TARGETS_RISM)

# how to engrave high-res PNGs from LY
# alternatively, one could create a PDF and convert to SVG with pdftocairo
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

# how to engrave SVGs from PAE
$(TARGETS_RISM): incipits/%.svg: data_generated/rism_incipits_pae/%.pae
>mkdir -p $(@D)
>$(VEROVIO) -o $@ $<
