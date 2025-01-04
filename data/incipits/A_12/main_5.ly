\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \key a \minor \time 4/4 \tempoMarkup "Presto moderato"
  a'2^\partVii c
  h4 e4. d8 a h \gotoBar "13"
  \clef soprano \autoBeamOff a2^\part "Jobs Frau" c
  h4 e4. d8 a h
  c g c2 h4
  c
}

text = \lyricmode {
  \skips 7
  Wer Gott
  will, Gott _ will was
  an -- ge -- lo -- _
  ben,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
