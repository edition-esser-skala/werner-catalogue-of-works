\version "2.24.2"
\include "header.ly"

ViolaI = {
  \relative c' {
    \clef soprano
    \twotwotime \key c \major \time 2/2 \tempoMarkup "Alla capella"
    c'1
    a2 a
    h h
    c1
    c2 e
    d1
    c
    h2 c~
    c a
    g g
  }
}

ViolaII = {
  \relative c' {
    \clef alto
    \twotwotime \key c \major \time 2/2 \tempoMarkup "Alla capella"
    R1
    c2 f~
    f d
    g4 a g f
    e2 r
    r g
    g a~
    a g~
    g fis
    g1
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 2/2 \tempoMarkup "Alla capella" \autoBeamOff
    c'1
    a2 a
    h h
    c1
    c2 e
    d1
    c
    h2 c~
    c a
    g g
  }
}

SopranoLyrics = \lyricmode {
  A --
  ve Ma --
  ri -- a
  kla --
  re, du
  hel --
  ler
  Mor -- _
  gen --
  ſtern, du
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 2/2 \tempoMarkup "Alla capella" \autoBeamOff
    R1
    c2 \once \tieDashed f~
    f d
    g4 a g f
    e2 r
    r g
    g a~
    a \once \tieDashed g~
    g fis
    g1
  }
}

AltoLyrics = \lyricmode {
  A -- ve __
  Ma --
  ri -- _ _ _
  a,
  du
  hel -- ler __
  Mor --
  gen --
  ſtern,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 2/2 \tempoMarkup "Alla capella" \autoBeamOff
    R1
    r2 c
    d h
    g1
    g2 r
    r h
    c d
    d e~
    e d
    h1
  }
}

TenoreLyrics = \lyricmode {
  A --
  ve Ma --
  ri --
  a,
  du
  hel -- ler
  Mor -- _
  gen --
  ſtern,
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 2/2 \tempoMarkup "Alla capella" \autoBeamOff
    R1
    f
    d2 g
    e4 f e d
    c1
    r2 g'
    e fis
    g e
    c d
    g,1
  }
}

BassoLyrics = \lyricmode {
  A --
  ve Ma --
  ri -- _ _ _
  a,
  du
  hel -- ler,
  hel -- ler
  Mor -- gen --
  ſtern,
}

Organo = {
  \relative c {
    \clef soprano
    \twotwotime \key c \major \time 2/2 \tempoMarkup "Alla capella"
    c''1-!
    \clef bass f,,
    d2 g
    e4 f e d
    c1
    r2 g'
    e fis
    g e
    c d
    g,1
  }
}

BassFigures = \figuremode {
  r1
  r
  <6>
  r
  r
  r
  <6>2 <6 5>
  r <6>
  <6 5> <_+>
  r1
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "vla"
        \new Staff {
          \set Staff.instrumentName = "1"
          \ViolaI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ViolaII
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
