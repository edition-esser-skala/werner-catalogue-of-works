\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 3/4 \autoBeamOff \tempoMarkup "Andante"
  c'4^\partSs c2
  d8[ h] c2
  e8[ d] d[ c] h[ c]
  d[ h] c4 r
}

text = \lyricmode {
  Sal -- ve,
  sal -- ve,
  sal -- ve Re --
  gi -- na,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
