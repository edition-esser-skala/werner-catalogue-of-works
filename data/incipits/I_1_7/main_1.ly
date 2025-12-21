\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key g \major \time 4/4 \tempoMarkup "Largo" \autoBeamOff
  g4.^\partTs h8 a d, \clef alto d'8^\partAs fis
  e a, e'16[ fis] e[ fis] g4. g8
  fis4 gis8[ a16 \hA gis] a8 a g fis
}

text = \lyricmode {
  Al -- ma Ma -- ter, Al -- ma
  Ma -- ter, Re -- dem -- pto -- ris
  Ma -- _ _ ter, Re -- "dem -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
