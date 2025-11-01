\version "2.24.2"
\include "header.ly"

tl = {
  \once \override LyricText.self-alignment-X = #LEFT
  \override LyricSpace.minimum-distance = #1
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 6/2 \tempoMarkup "In chorali" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    g'\breve a2 g
    g\breve fis2 e\fermata \bar "||"
    \time 4/2 \tempoMarkup "Alla capella" r2 d'1 d2
    c1 c2 c~
    c b a1~
    a2 a a1
  }
}

SopranoLyrics = \lyricmode {
  \tl "Miserere mei," De -- us,
  \tl "secundum magnam misericordiam" tu -- am.
  Et se --
  cun -- dum mul --
  ti -- tu --
  di -- nem
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 6/2 \tempoMarkup "In chorali" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    e\breve f2 e
    d\breve d2 cis\fermata \bar "||"
    \time 4/2 \tempoMarkup "Alla capella" f!1 f
    f1. e2
    d g1 f2
    e f e a~
  }
}

AltoLyrics = \lyricmode {
  \tl "Miserere mei," De -- us,
  \tl "secundum magnam misericordiam" tu -- am.
  Et se --
  cun -- dum
  mul -- _ ti --
  tu -- di -- nem "mi -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 6/2 \tempoMarkup "In chorali" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    c\breve c2 c
    h\breve a2 a\fermata \bar "||"
    \time 4/2 \tempoMarkup "Alla capella" a1 a2 b~
    b a g1
    g a
    a2. d4 cis1
  }
}

TenoreLyrics = \lyricmode {
  \tl "Miserere mei," De -- us,
  \tl "secundum magnam misericordiam" tu -- am.
  Et se -- cun --
  _ dum
  mul -- ti --
  tu -- di -- nem
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 6/2 \tempoMarkup "In chorali" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    c\breve f2 c
    g'\breve d2 a \fermata \bar "||"
    \time 4/2 \tempoMarkup "Alla capella" d1. d2
    f1 c
    g' d
    cis2 d a1
  }
}

BassoLyrics = \lyricmode {
  \tl "Miserere mei," De -- us,
  \tl "secundum magnam misericordiam" tu -- am.
  Et se --
  cun -- dum
  mul -- ti --
  tu -- di -- nem
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 6/2 \tempoMarkup "In chorali"
      \set Staff.timeSignatureFraction = 2/2
    R1*6/2
    R \bar "||"
    \time 4/2 \tempoMarkup "Alla capella" d1. d2
    f1 c
    g' d
    cis2 d a1
  }
}

BassFigures = \figuremode {
  r2*6
  r
  r1. <6->2
  <4> <3> <4> <3>
  <4> <_-> <4> <3>
  r1 <_+>
}

\score {
  <<
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
