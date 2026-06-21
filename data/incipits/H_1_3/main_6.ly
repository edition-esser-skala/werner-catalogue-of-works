\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
  r4^\partSs r8 d g h16[ a] g8 a
  h d16[ c] h8 a^\partSc h8. h16 h4
  d^\partSs d8 d d d, d'4~
}

text = \lyricmode {
  Ma -- gni -- fi -- cat, ma --
  gni -- fi -- cat, ma -- gni -- fi -- cat
  a -- ni -- ma me -- a "Do -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
