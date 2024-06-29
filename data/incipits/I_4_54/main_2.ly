\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key b \major \time 4/4 \tempoMarkup "Andante" \autoBeamOff
  r8^\partBs f b b b a16[ g] f[ es] d[ c]
  d8 b f' b b16[ a] a8 f es'
  es16[ c] d8 r f, g[ a16 b] c[ d] es[ c]
}

text = \lyricmode {
  Vi -- ta, dul -- ce -- do et spes
  no -- stra, et spes no -- stra, et spes
  no -- stra, spes no -- _ stra,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
