\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key f \major \time 2/4 \tempoMarkup "Allegro" \autoBeamOff
  c'2^\partSs
  d8.[\trill e32 f] c4
  r8 f, \tuplet 3/2 8 { g16[ a b] a[ b c] }
  b4\trill a
}

text = \lyricmode {
  Sal --
  _ ve,
  sal -- ve Re --
  gi -- na,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
