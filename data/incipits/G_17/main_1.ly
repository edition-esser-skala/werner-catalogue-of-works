\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key a \minor \time 3/4 \tempoMarkup "Largo" \autoBeamOff
  r4^\partSs a' c
  h2 a4
  g a f
  f8[ e] e4 g~
}

text = \lyricmode {
  Ky -- ri --
  e e --
  lei -- son, e --
  lei -- son, "e -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
