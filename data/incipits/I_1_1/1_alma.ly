\version "2.24.2"
\include "header.ly"

ViolaI = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/2 \tempoMarkup "Alla capella"
      \set Staff.timeSignatureFraction = 2/2
    r2 c'1 h4 a
    g2 e'1 d4 c
    h a g1 fis2
    g g a4 h c d
    e1 d
  }
}

ViolaII = {
  \relative c' {
    \clef alto
    \key c \major \time 4/2 \tempoMarkup "Alla capella"
      \set Staff.timeSignatureFraction = 2/2
    e2 e f2. f4
    e f g e a2. a4
    g2 h e, a
    d, e f!4 g a h
    c2. h4 a2. g8 f
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/2 \tempoMarkup "Alla capella" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    r2 c'1 h4 a
    g2 e'1 d4 c
    h a g2 g fis
    g g a4 h c d
    e1 d
  }
}

SopranoLyrics = \lyricmode {
  Al -- _ _
  ma Re -- dem -- _
  pto -- _ ris Ma -- _
  ter, quae per -- _ vi -- a
  coe -- li
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/2 \tempoMarkup "Alla capella" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    e2 e f2. f4
    e f g e a2. a4
    g2 h e, a
    d, e f!4 g a h
    c2. h4 a2. g8[ f]
  }
}

AltoLyrics = \lyricmode {
  Al -- ma Re -- dem --
  pto -- _ ris, _ Re -- dem --
  pto -- ris Ma -- _
  ter, quae per -- _ vi -- a
  "coe -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/2 \tempoMarkup "Alla capella" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    g2 c a h
    c1. d2
    d2. c8[ h] c4 e d c
    h2 r r1
    r2 e, f4 g a h
  }
}

TenoreLyrics = \lyricmode {
  Al -- ma Re -- dem --
  pto -- ris
  Ma -- _ _ _ _ _
  ter,
  quae per -- _ vi -- a
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/2 \tempoMarkup "Alla capella" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    c1 d
    e f
    g2 g a1
    g2 r r1
    r2 c, d4 e f g
  }
}

BassoLyrics = \lyricmode {
  Al -- ma
  Re -- dem --
  pto -- ris Ma --
  ter,
  quae per -- _ vi -- a
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/2 \tempoMarkup "Alla capella"
      \set Staff.timeSignatureFraction = 2/2
    c1 d
    e f
    g a
    g2 \clef soprano << { g' a4 h c d e2 } \\ { e,2 f!4 g a h c2 } >>
    \clef bass c,, d4 e f g
  }
}

BassFigures = \figuremode {
  r1 <7>2 <6>
  <6> <8> <7> <6>
  r1 <7>2 <6\\>
  r\breve
  r
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
