\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key g \major \time 4/4 \tempoMarkup "Andante" \autoBeamOff
  g8^\partBs g' fis e d4. d8
  d h16[ g] d'8. d16 g,4 r
  \clef soprano r2^\partSs g''16[ a] h[ c] d8 e16[ fis]
}

text = \lyricmode {
  Sub tu -- um prae -- si -- di --
  um con -- fu -- gi -- mus,
  no -- stras de -- "pre -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
