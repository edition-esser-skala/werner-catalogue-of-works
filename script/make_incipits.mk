# use this instead of tabs for marking recipe lines
.RECIPEPREFIX = >

# invocation of LilyPond
LILYPOND = lilypond \
  --include=$(EES_TOOLS_PATH) \
  --include=$(realpath data/incipits) \
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
# e.g. data/incipits/Q_2/main_1.ly -> Q_2/main_1
SOURCES_LY := $(shell find data/incipits -type f -name "*.ly" -and -not -name "header.ly")
SOURCES_LY := $(SOURCES_LY:data/incipits/%.ly=%)

# all MEI files in data/incipits,
# e.g. data/incipits/B_46/main_1.mei -> B_46/main_1
SOURCES_MEI := $(shell find data/incipits -type f -name "*.mei")
SOURCES_MEI := $(SOURCES_MEI:data/incipits/%.mei=%)

# all PAE files in data_generated/rism_incipits,
# e.g. data_generated/rism_incipits/A_5/main_1.pae -> A_5/main_1
SOURCES_RISM := $(shell find data_generated/rism_incipits -type f -name "*.pae")
SOURCES_RISM := $(SOURCES_RISM:data_generated/rism_incipits/%.pae=%)

# remove incipits for which a manually curated version is available
SOURCES_RISM := $(filter-out $(SOURCES_LY),$(SOURCES_RISM))
SOURCES_RISM := $(filter-out $(SOURCES_MEI),$(SOURCES_RISM))

# names of manually curated incipits to be created by LilyPond,
# e.g. incipits/Q_2/main_1.svg
TARGETS_LY := $(SOURCES_LY:%=incipits/%.svg)

# names of manually curated incipits to be created by Verovio,
# e.g. incipits/B_46/main_1.svg
TARGETS_MEI := $(SOURCES_MEI:%=incipits/%.svg)

# names of RISM incipits to be created by Verovio,
# e.g. incipits/A_1_3/main_1.svg
TARGETS_RISM := $(SOURCES_RISM:%=incipits/%.svg)


# execute all recipe lines in a single shell,
# since we use variables in the recipes
.ONESHELL:

# default target: create all incipits
all: $(TARGETS_LY) $(TARGETS_MEI) $(TARGETS_RISM)

# how to engrave SVGs from LY
$(TARGETS_LY): incipits/%.svg: data/incipits/%.ly data/incipits/header.ly
>mkdir -p $(@D)
>target_name=$(basename $@ .svg)
>$(LILYPOND) -o $${target_name} $<
>pdftocairo $${target_name}.cropped.pdf -svg $${target_name}.svg
>script/svg_process_ly.sh $${target_name}.svg
>svgo $${target_name}.svg
>rm $${target_name}.cropped.* $${target_name}.pdf

# how to engrave SVGs from MEI
$(TARGETS_MEI): incipits/%.svg: data/incipits/%.mei
>mkdir -p $(@D)
>$(VEROVIO) -o $@ $<
>script/svg_process_pae.sh $@

# how to engrave SVGs from PAE
$(TARGETS_RISM): incipits/%.svg: data_generated/rism_incipits/%.pae
>mkdir -p $(@D)
>$(VEROVIO) -o $@ $<
>script/svg_process_pae.sh $@
