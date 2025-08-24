\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key a \minor \time 4/2 \tempoMarkup "Alla capella" \autoBeamOff
    \set Staff.timeSignatureFraction = 2/2
  a'1^\partBc e2 e
  f1 \clef soprano e''^\partSc
  a,2 a c2. c4
  h2 h a1
}

text = \lyricmode {
  O sa -- lu --
  "ta -" O
  sa -- lu -- ta -- ris
  ho -- sti -- a,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
