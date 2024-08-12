\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key c \major \time 3/4 \tempoMarkup "A tempo giusto"
  g'2.^\partVi
  c
  e \gotoBar "30"
  \clef soprano \autoBeamOff g,2.^\partSs
  c
  e
  d16[ h8.] c2
}

text = \lyricmode {
  \skips 3
  Sal --
  _
  _
  _ \hy
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
