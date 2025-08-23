\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key d \minor \time 2/1 \tempoMarkup "Alla capella moderato" \autoBeamOff
    \set Staff.timeSignatureFraction = 2/2
  d1.^\partTc c2
  \clef soprano d'1.^\partSc c2
  b4 a b2 a a
  h cis d4 e f e
}

text = \lyricmode {
  Al -- ma
  Al -- ma
  Ma -- _ _ ter, Re -- 
  _ dem -- pto -- _ ris _
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
