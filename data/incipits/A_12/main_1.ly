\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \key g \minor \time 4/4 \tempoMarkup "Adagiosè"
  g'4.\p^\partVi a8 b( c) d es16( d)
  es4. g,8 fis2
  g4. b'8 cis,4.\f d16( \hA cis)
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
