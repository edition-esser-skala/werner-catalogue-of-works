\version "2.24.2"
\include "header.ly"

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 3/2 \autoBeamOff \tempoMarkup "Andante"
    R1.*2 \gotoBar "7"
    g2^\solo g g
    c c c
    d d2. c8[ d]
    e2 c r
  }
}

TenoreLyrics = \lyricmode {
  Re -- gi -- na
  coe -- li, lae --
  ta -- re, lae --
  ta -- re,
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 3/2 \tempoMarkup "Andante"
    c4-\solo c'8 h c4 c8 h c4 g
    a, a'8 g a4 a8 g a4 e \gotoBar "7"
    c c'8 h c4 c8 h c4 g
    a, a'8 g a4 a8 g a4 e
    f, f'8 e f4 d g g,
    c c'8 h c4 c8 h c4 g
  }
}

BassFigures = \figuremode {
  r1.
  r
  r
  r
  <6>
  r
}

\score {
  <<
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }
      \new Lyrics \lyricsto Tenore \TenoreLyrics
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
