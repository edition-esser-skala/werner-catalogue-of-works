\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key e \minor \time 3/4 \tempoMarkup "Adagio"
  e'8^\partVi h e g16 fis e h' g e
  fis8 h, fis' a16 g fis c' a fis
  g32 fis e8. h'4 a16 g fis e
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
