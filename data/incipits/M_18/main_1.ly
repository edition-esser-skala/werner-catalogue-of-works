\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key g \dorian \time 3/2 \tempoMarkup "Largo"
  d'4(^\partVi g,) g2 r
  es'4( g,) g2 r
  a'4( d,) b'2. b,4
  a2 fis4. g8 a b c d
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
