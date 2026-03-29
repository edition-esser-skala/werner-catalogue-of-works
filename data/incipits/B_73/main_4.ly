\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \minor \time 4/4 \tempoMarkup "Adagio" \autoBeamOff
  a'4.^\partSs a8 b2
  a r
  r4 f f f8 f
  fis2. g4
  a2 g4
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
