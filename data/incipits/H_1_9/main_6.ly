\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
  a'2^\partSs h4 a
  d4. d8 d2
  d4 d8 d h4 d
  e4. e8 d4 r
}

text = \lyricmode {
  Ma -- _ _
  gni -- fi -- cat
  a -- ni -- ma me -- a
  Do -- mi -- num.
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
