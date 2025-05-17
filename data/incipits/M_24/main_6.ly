\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key g \minor \time 4/4 \tempoMarkup "Adagio ma poco"
  g'4.^\partVi a8 b( c) d es16( d)
  es4. g,8 fis2
  g4. b'8 cis,4. d16( cis)
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
