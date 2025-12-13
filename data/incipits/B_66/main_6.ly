\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
  d4.^\partAs e8 f4 f8 g16[ a]
  cis,4 cis16[ d] e8 e[ d] d4
  r a' a8[ d,] g4
}

text = \lyricmode {
  A -- gnus De -- i, qui
  tol -- lis pec -- ca -- ta,
  pec -- ca -- ta,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
