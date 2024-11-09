\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
  c2^\partAc g'4.*2/3 \clef soprano g4^\partSc
  c4. c8 c4 a~
  a8 h16 c d8 c h4 c
}

text = \lyricmode {
  Ma -- "gni -" Ma --
  gni -- fi -- cat a --
  ni -- ma me -- a Do -- \hy
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
