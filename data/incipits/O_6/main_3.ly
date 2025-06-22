\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key g \major \time 4/4 \tempoMarkup "Tempo ordinario"
  h'16.\trill_\partVi a64( h) d16.[\trill c64( d)] g16.\trill fis64( g) h16.[\trill a64( h)] c2
  h a
  g fis16. fis32 fis16. fis32 fis16. fis32 fis16. fis32
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
