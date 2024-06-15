\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key a \minor \time 4/4 \tempoMarkup "Tempo ordinario" \autoBeamOff
  r8^\partSs e a gis c4. h8
  r a4 g8 f4\trill e
  r8 d'4 c8 f8. f16 e4
}

text = \lyricmode {
  A -- ve Re -- gi -- na
  coe -- _ lo -- rum,
  a -- ve Do -- mi -- na
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
