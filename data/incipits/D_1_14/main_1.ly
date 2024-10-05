\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
  r8^\partSc d' g, a h h16[ c] d8 a
  h h h g d'2
  d4 r8 e4 d16 d d8[ cis]
  d
}

text = \lyricmode {
  In de -- di -- ca -- ti -- o -- ne
  tem -- pli de -- can -- ta --
  bat po -- pu -- lus lau --
  dem
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
