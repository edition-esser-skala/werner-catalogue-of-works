\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \twofourtime \key a \minor \time 2/4 \tempoMarkup "Tempo passato"
  r4 r8 f'~^\partVi
  f16 e e,8 r e'~
  e16 d d,8 r d'~
  d16 c e,8 r4
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
