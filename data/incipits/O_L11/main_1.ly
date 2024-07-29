\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key g \minor \time 4/4 \tempoMarkup "[no tempo]"
  d'4^\partUnk g8 a16 b fis4 r16 fis g a
  c,4 c16 es d c b8. a16 g4
  h8. d16 es as g h, c4 r8 c
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
