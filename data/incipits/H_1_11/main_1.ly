\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key g \major \time 3/2 \tempoMarkup "Andante" \autoBeamOff
  h'4.^\partSc d16[ c] h4 a h4. h8
  a4 g d' e d2
  d4 h2 a4 h e
}

text = \lyricmode {
  Di -- _ _ xit Do -- mi --
  nus Do -- mi -- no me --
  o: Se -- de, "se -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
