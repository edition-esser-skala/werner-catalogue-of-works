\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key b \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
  d'8^\partSc d16 d d8 f d c r f
  d c b c a8. a16 b8 c
  d16[ es d c] b[ a g f'] e[ f e d] c[ b] a[ g]
}

text = \lyricmode {
  Glo -- ri -- a et ho -- no -- re, ho --
  no -- re co -- ro -- na -- vit, co -- ro --
  na -- _ _ _ vit
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
