\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key c \major \time 3/4 \tempoMarkup "[no tempo]"
  c'8^\partVi g'4 a16 g a8 d,
  e g,4 a16 g a8 d, \gotoBar "15"
  \clef soprano \autoBeamOff g4^\partSs c d
  e4. d8 c4
}

text = \lyricmode {
  \skips 12
  Pa -- nis An -- 
  ge -- li -- cus
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
