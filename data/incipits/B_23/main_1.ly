\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 3/2 \tempoMarkup "Alla capella" \autoBeamOff
  g'2.^\partSc e4 a2
  r4 fis h g c2
  r4 a d4. c8 h4.\trill a8
  g2

}

text = \lyricmode {
  Ky -- ri -- e
  e -- lei -- _ son,
  e -- lei -- _ _ _
  son,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
