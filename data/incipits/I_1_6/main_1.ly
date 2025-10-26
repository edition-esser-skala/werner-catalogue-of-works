\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key d \dorian \time 4/4 \tempoMarkup "Alla capella · Allegro" \autoBeamOff
  r4^\partAc d4. cis8 e4~
  e8 d \clef soprano a'2^\partSc gis8[ h]
  h a c2 h8[ a]
}

text = \lyricmode {
  Al -- ma Re --
  dem Al -- ma
  Re -- dem -- pto -- ris
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
