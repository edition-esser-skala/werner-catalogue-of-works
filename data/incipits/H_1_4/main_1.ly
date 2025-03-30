\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \minor \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
  d'8^\partSc d d d16 d cis8 d16 d d8[ cis]
  d4 r c8^\partSs f f e
  f16 e f c d4 c8 d b c
}

text = \lyricmode {
  Di -- xit Do -- mi -- nus Do -- mi -- no me --
  o: do -- nec po -- nam
  in -- i -- mi -- cos tu -- os, sca -- bel -- lum
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
