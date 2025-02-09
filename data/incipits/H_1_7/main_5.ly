\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 3/4 \autoBeamOff \tempoMarkup "Moderato"
  e'4^\partSc e, e'8 e
  e4 e, e'
  d8[ e] d[ c] h[ d]
  c4. d8 e4
}

text = \lyricmode {
  Lau -- da, lau -- da,
  lau -- da Ie --
  ru -- sa -- lem,
  Do -- mi -- num,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
