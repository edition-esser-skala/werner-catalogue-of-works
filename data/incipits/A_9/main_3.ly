\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key c \dorian \time 4/4 \tempoMarkup "Adagio"
  d1^\part "t-trb"
  \clef soprano \autoBeamOff d'4^\partSc r8 d f f f f
  e2 r
  c r4 r8 c
}

text = \lyricmode {
  \skips 1
  Ach! Ô un -- er -- hör -- te
  Sach!
  Ach! "der -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
