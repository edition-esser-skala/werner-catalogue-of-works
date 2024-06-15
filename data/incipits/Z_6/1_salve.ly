\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "A tempo giusto"
    g'2.
    c
    e \gotoBar "30"
    g,\p
    c
    e
    d16( h8.) c2
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "A tempo giusto"
    g'2.
    c
    e \gotoBar "30"
    r4 e,\p h
    r c' g
    r g2~
    g4 g2~
  }
}

Viola = {
  \relative c' {
    \clef alto
    \key c \major \time 3/4 \tempoMarkup "A tempo giusto"
    r4 e h
    r g' e
    r g g \gotoBar "30"
    r c, g
    r g' e
    r c' c,
    r g' e
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 3/4 \tempoMarkup "A tempo giusto" \autoBeamOff
    R2.*3 \gotoBar "30"
    g'2.^\solo
    c
    e
    d16[ h8.] c2
  }
}

SopranoLyrics = \lyricmode {
  "Sal -"
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 3/4 \tempoMarkup "A tempo giusto"
    r4 c' g
    r e c
    r c' c, \gotoBar "30"
    r c'\p g
    r e c
    r c' c,
    f e c
  }
}

BassFigures = \figuremode {
  r2.
  r
  r
  r
  r
  r
  <4 2>4 <6>2
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff \with { \smallGroupDistance } <<
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
      \new Staff {
        \set Staff.instrumentName = "vla"
        \Viola
      }
    >>
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "S"
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
      \new Lyrics \lyricsto Soprano \SopranoLyrics
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
