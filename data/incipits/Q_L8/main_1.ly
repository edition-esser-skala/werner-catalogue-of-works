\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key d \major \time 4/4 \tempoMarkup "[no tempo]"
  \partial 8 a8^\part "vlc [?]" d4 e fis16 g a8 r d,
  e8. fis32 g fis8 e
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
