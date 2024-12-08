\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key a \minor \time 4/4 \tempoMarkup "Allegro"
  a2^\partVii f'4. e16 f
  dis8 dis dis dis h'4. a16 h
  gis8 gis gis gis e'4 a,~
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
