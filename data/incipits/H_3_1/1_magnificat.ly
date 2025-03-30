\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key b \major \time 4/4 \tempoMarkup "Adagio"
    r4 b' b2
    a4 h c8. c16 c4
    g'8 es16 d c8 b16 c a8 b4 b8
    g16 a b4 a8 \tempoMarkup "Allegro" b16 b'32 f es16 d es16. d32 c16. f32
    d16 b' b32 as g16 \hA as16. g32 f16. b32 g16 g g32 f es16 f16. es32 d16. g32
    es16 es es32 d c16 d16. c32 b!16. es32 c16. b32 a16. d32 b8 es~
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key b \major \time 4/4 \tempoMarkup "Adagio"
    r4 f f2
    f4 g g8. g16 g4
    r c,8 d16 es f8 f4 f8
    g16 a b4 a8 \tempoMarkup "Allegro" b16 b'32 f es16 d es16. d32 c16. es32
    d8 es4 d8 es c4 h8
    c g4 g8 a!4 b
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key b \major \time 4/4 \tempoMarkup "Adagio" \autoBeamOff
    r4 b'^\tutti b4. b8
    a4 h c8. c16 c4
    g'8 es16 d c8 b16 c a8[ b] b4
    g16[ a] b4 a8 \tempoMarkup "Allegro" b d es c
    d es4 d8 es d16 c c8[ h]
    c c d es4 d16 a! b8[ es]
  }
}

SopranoLyrics = \lyricmode {
  Ma -- gni -- fi --
  cat, ma -- gni -- fi -- cat
  a -- ni -- ma, a -- ni -- ma me -- a
  Do -- _ mi -- num, et ex -- ul --
  ta -- _ vit spi -- ri -- tus me --
  us in De -- o sa -- lu -- "ta -"
}

Alto = {
  \relative c' {
    \clef alto
    \key b \major \time 4/4 \tempoMarkup "Adagio" \autoBeamOff
    r4 f^\tutti f4. f8
    f4 g g8. g16 g4
    r c,8 d16 es f4 f
    g8 f4 f8 \tempoMarkup "Allegro" f f es f
    f g f f16 f g8 as4 g8
    g g g4 a8 a g g
  }
}

AltoLyrics = \lyricmode {
  Ma -- gni -- fi --
  cat, ma -- gni -- fi -- cat
  a -- ni -- ma me -- a
  Do -- _ mi -- num, et ex -- ul --
  ta -- vit spi -- ri -- tus me -- _ _
  us in De -- o, in De -- o
}

Tenore = {
  \relative c' {
    \clef tenor
    \key b \major \time 4/4 \tempoMarkup "Adagio" \autoBeamOff
    r4 d^\tutti d4. d8
    c4 d es8. es16 es4
    r2 c8 d16 d d8 d
    b[ d] c8.\trill c16 \tempoMarkup "Allegro" d8 b c c
    b b as b16 b b8[ c] d4
    es8 es d[ b] c d d b
  }
}

TenoreLyrics = \lyricmode {
  Ma -- gni -- fi --
  cat, ma -- gni -- fi -- cat
  a -- ni -- ma me -- a
  Do -- _ mi -- num, et ex -- ul --
  ta -- vit spi -- ri -- tus me -- _
  us in De -- o, in De -- o
}

Basso = {
  \relative c {
    \clef bass
    \key b \major \time 4/4 \tempoMarkup "Adagio" \autoBeamOff
    r4 b^\tutti f'4. f8
    f4 f es8. d16 c4
    r2 f8 d16 c b8 d
    es[ d16 es] f8. f16 \tempoMarkup "Allegro" b,8 b' b a
    b es, f b16 b es,8[ as f g]
    c, c' b! g16 g g8[ fis] g4
  }
}

BassoLyrics = \lyricmode {
  Ma -- gni -- fi --
  cat, ma -- gni -- fi -- cat
  a -- ni -- ma me -- a
  Do -- _ mi -- num, et ex -- ul --
  ta -- vit spi -- ri -- tus me --
  us in De -- o, in De -- o
}

Organo = {
  \relative c {
    \clef bass
    \key b \major \time 4/4 \tempoMarkup "Adagio"
    r4 b-\tutti f'2
    f4 f es8. d16 c4
    \clef soprano << { g'''8 es16 d c8 b!16 c } \\ { r4 c,8 d16 es } >> \clef bass f,8 d16 c b8 d
    es8 d16 es f8. f16 \tempoMarkup "Allegro" b,8 b' b a
    b es, f b es, as f g
    c,[ c'] b! g4 fis8 g4
  }
}

BassFigures = \figuremode {
  r2 <6 4>
  <5 3>4 <6 4! 2> <6>2
  r2 r8 <6>4 q8
  r4 <4>8 <3>4. <2>8 <6>
  r4 <7 _->2 <6 5>8 <_!>
  r4 <6>8 q <2> <6> <5> <6>
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
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
