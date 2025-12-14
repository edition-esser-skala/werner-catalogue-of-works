\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key b \major \time 4/4 \tempoMarkup "Adagio"
    r4 b' es8. es16 es4
    es d8 c d f f e
    \tempoMarkup "Allegro" f f, a c f e16 d c b a g
    f f' c f d f c f d f c f d f c f
    d4 c16 f es f g g, g' f es f32 es d16 es
    f f, f' es d es32 d c16 d es es, es' d c d32 c b16 c
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key b \major \time 4/4 \tempoMarkup "Adagio"
    r4 b' g8. g16 g4
    f4. c'8 d c b8. b16
    \tempoMarkup "Allegro" a8 f a c f e16 d c b a g
    f f' c f d f c f d f c f d f c f
    d4 c16 f es f g g, g' f es f32 es d16 es
    f f, f' es d es32 d c16 d es es, es' d c d32 c b16 c
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key b \major \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    r4 b'^\tutti es8. es16 es4
    es d8 c d c b8. b16
    \tempoMarkup "Allegro" a8 f a c f e16[ d] c[ b] a[ g]
    f8 f d' c d c d f16 es
    d4 c8 f g4~ g16[ es] d[ c]
    f4~ f16[ d] c[ b] es4~ es16[ d es c]
  }
}

SopranoLyrics = \lyricmode {
  Ma -- gni -- fi -- cat
  a -- ni -- ma me -- a Do -- mi --
  num, et ex -- ul -- ta -- vit, ex -- ul --
  ta -- vit, ex -- ul -- ta -- vit spi -- ri -- tus
  me -- us in De -- o
  sa -- lu -- "ta -"
}

Alto = {
  \relative c' {
    \clef alto
    \key b \major \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    r4 f^\tutti g8. g16 g4
    f f8 f f f f e
    \tempoMarkup "Allegro" f4 r r2
    r8 f f f f f f f16 f
    f4 f r8 b c4
    a b8 b g4 a
  }
}

AltoLyrics = \lyricmode {
  Ma -- gni -- fi -- cat
  a -- ni -- ma me -- a Do -- mi --
  num,
  et ex -- ul -- ta -- vit spi -- ri -- tus
  me -- us in De --
  o sa -- lu -- ta -- ri,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key b \major \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    r4 d^\tutti c8. c16 c4
    c c8 c b c d c16[ b]
    \tempoMarkup "Allegro" c4 r r2
    r8 a b c b a b c16 c
    b4 a8 f' f4 es
    es d d c
  }
}

TenoreLyrics = \lyricmode {
  Ma -- gni -- fi -- cat
  a -- ni -- ma me -- a Do -- mi --
  num,
  et ex -- ul -- ta -- vit spi -- ri -- tus
  me -- us in De -- o
  sa -- lu -- ta -- ri,
}

Basso = {
  \relative c {
    \clef bass
    \key b \major \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    r4 b'^\tutti b8. b16 b4
    a a8 a b a g8. g16
    \tempoMarkup "Allegro" f4 r r2
    r8 f b a b f b a16 a
    b4 f8 d es4 c
    d b c a
  }
}

BassoLyrics = \lyricmode {
  Ma -- gni -- fi -- cat
  a -- ni -- ma me -- a Do -- mi --
  num,
  et ex -- ul -- ta -- vit spi -- ri -- tus
  me -- us in De -- o
  sa -- lu -- ta -- ri
}

Organo = {
  \relative c {
    \clef bass
    \key b \major \time 4/4 \tempoMarkup "Adagio"
    b4-\tutti b' b2
    a b8 a g4
    \tempoMarkup "Allegro" f r f r
    r8 f b a b f b a
    b4 f8 d es es c c
    d d b b c c a a
  }
}

BassFigures = \figuremode {
  r2 <4 2>
  <6 5>2. <7>8 <6>
  r1
  r
  r4. <6>8 <9>2
  q q
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "vl"
        \new Staff {
          \set Staff.instrumentName = "1"
          \ViolinoI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ViolinoII
        }
      >>
    >>
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "S"
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
      \new Lyrics \lyricsto Soprano \SopranoLyrics

      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics

      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }
      \new Lyrics \lyricsto Tenore \TenoreLyrics

      \new Staff {
        \set Staff.instrumentName = "B"
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
      \new Lyrics \lyricsto Basso \BassoLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
