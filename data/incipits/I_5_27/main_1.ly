\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \major \time 2/2 \autoBeamOff \tempoMarkup "[no tempo]"
  r2^\partSc d'
  cis d~
  d4 fis h,4. h8
  ais4 ais h8[ ais h cis]
}

text = \lyricmode {
  Sub
  tu -- um __
  prae -- si -- di --
  um con -- "fu -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
