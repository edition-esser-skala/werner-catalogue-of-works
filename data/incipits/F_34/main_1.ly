\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key f \lydian \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
  c'2^\partSc a4 d h2
  g4 c2 a4 g2
  R1.
}

text = \lyricmode {
  Chri -- ste re -- dem --
  ptor o -- mni -- um
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
