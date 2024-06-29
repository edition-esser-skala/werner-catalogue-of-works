\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key a \minor \time 6/8 \tempoMarkup "[no tempo]"
  e'8.^\partVi f16 e8 dis h' r
  d,8. e16 d8 cis a' r
  c,8. d16 c8 h g' r
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
