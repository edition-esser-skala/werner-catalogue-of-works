\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key d \minor \time 4/2 \tempoMarkup "Alla capella" \autoBeamOff
    \set Staff.timeSignatureFraction = 2/2
  a1^\partTc a
  \clef soprano a'1^\partSc a
  d,2 d'1 c2
  b1 a2 d
}

text = \lyricmode {
  In "mon -"
  In mon --
  te o -- li --
  ve -- ti, "o -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
