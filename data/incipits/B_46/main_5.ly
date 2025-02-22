\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key e \minor \time 4/4 \autoBeamOff \tempoMarkup "Larghetto"
  e4.^\partAs dis8 g4 fis
  r8 e e[ d] c4 h8 g'
  g[ fis] e fis g8. g16 fis8 fis
}



text = \lyricmode {
  Be -- ne -- di -- ctus,
  qui ve -- _ nit, qui
  ve -- nit in no -- mi -- ne "Do -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
