\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key b \major \time 6/8 \tempoMarkup "Tempo giusto"
  b'8.^\partVi c16 d es f4 b8
  a c16 b a g f8 b es, \gotoBar "10"
  \clef tenor \autoBeamOff f,,8^\part "Lucifer" b b b[ a] g
  f4
}

text = \lyricmode {
  \skips 14
  Waß ach -- te ich der
  Peyn,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
