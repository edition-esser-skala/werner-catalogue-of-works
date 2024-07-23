\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key e \minor \time 3/2 \tempoMarkup "Cantabile"
  r4^\partV e g h e g
  r h, dis fis h fis \gotoBar "6"
  h,2^\partFl g4( e) e'( g)
  fis2. h,4 h'2

}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
