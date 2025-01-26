\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key c \major \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
  r2^\partAc c2. d4
  e c d e f2~
  f4 e8[ d] e4 d c e
}

text = \lyricmode {
  A -- ve
  ma -- ris stel -- la, a --
  _ _ ve ma -- ris
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
