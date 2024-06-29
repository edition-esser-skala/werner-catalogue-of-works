\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
  r8^\partTs a d4. e16[ fis] e8 d
  cis8. h16 a8 d h a g a16[ g]
  fis[ e] d8 d'4. cis16[ d] e8 d
}

text = \lyricmode {
  In con -- ver -- ten -- do
  Do -- mi -- nus ca -- pti -- vi -- ta -- tem
  Si -- on, fa -- cti su -- mus
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
