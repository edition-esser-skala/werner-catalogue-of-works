\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key f \major \time 3/2 \tempoMarkup "Andante" \autoBeamOff
  f2^\partSc g a4 c
  c1 a2
  b1 a2
  g1 r2
}

text = \lyricmode {
  Je -- su re -- _
  dem -- ptor
  o -- mni --
  um
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
