\version "2.24.2"
\include "header.ly"

ViolaI = {
  \relative c' {
    \clef soprano
    \twotwotime \key a \minor \time 2/2 \tempoMarkup "Alla capella"
    R1*6 %6
    e'2. e4
    a,2 d
    c1
    h2 h
  }
}

ViolaII = {
  \relative c' {
    \clef soprano
    \twotwotime \key a \minor \time 2/2 \tempoMarkup "Alla capella"
    R1*5
    a'2. a4
    e2 g
    f2. g4
    a1
    g
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key a \minor \time 2/2 \tempoMarkup "Alla capella" \autoBeamOff
    R1*6 %6
    e'2. e4
    a,2 d
    c1
    h2 h
  }
}

SopranoLyrics = \lyricmode {
  Al -- ma
  Re -- dem --
  pto --
  ris, quae
}

Alto = {
  \relative c' {
    \clef alto
    \key a \minor \time 2/2 \tempoMarkup "Alla capella" \autoBeamOff
    R1*5
    a'2. a4
    e2 g
    f2. g4
    a1
    g
  }
}

AltoLyrics = \lyricmode {
  Al -- ma
  Re -- dem --
  pto -- ris
  Ma --
  ter,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key a \minor \time 2/2 \tempoMarkup "Alla capella" \autoBeamOff
    R1
    e2. e4
    a,2 d
    c1
    h2 e~
    e4 d a h
    c d e2~
    e d
    e e~
    e4 e d2
  }
}

TenoreLyrics = \lyricmode {
  Al -- ma
  Re -- dem --
  pto --
  ris Ma --
  _ _ _
  _ _ _
  ter,
  quae per --
  vi -- a
}

Basso = {
  \relative c {
    \clef bass
    \key a \minor \time 2/2 \tempoMarkup "Alla capella" \autoBeamOff
    a'2. a4
    e2 g
    f1
    e4 a, a'2~
    a g
    f1
    c2 c
    d d4 d
    a h c d
    e f g2
  }
}

BassoLyrics = \lyricmode {
  Al -- ma
  Re -- dem --
  pto --
  ris _ Ma --
  ter,
  Ma --
  ter, quae
  per -- vi -- a
  "coe -"
}

Organo = {
  \relative c {
    \clef bass
    \twotwotime \key a \minor \time 2/2 \tempoMarkup "Alla capella"
    a'2. a4
    << {
      e'2. e4
      a,2 d
      c1
      h2 e
    } \\ {
      e,2 g
      f1
      e4 a, a'2~
      a g
    } >>
    f1
    c2 c
    d1
    a4 h c d
    e f g2~
  }
}

BassFigures = \figuremode {
  r1
  r
  r
  r
  r
  <7>4 <6>2.
  r1
  <9>2 <8>
  r1
  <5>
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
