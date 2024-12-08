\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key f \dorian \time 3/2 \tempoMarkup "Adagio"
  f'2^\partVi b,2. c4
  des2. es4 c2
  f4( des) b2 es~
  es2. f4 des2
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
