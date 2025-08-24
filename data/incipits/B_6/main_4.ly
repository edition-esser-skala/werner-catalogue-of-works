\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
  r4 a'^\partSc h4. cis16[ d]
  a8[ d,] d'4 c2\trill
  h4 r r8 d d d
}

text = \lyricmode {
  San -- _ _
  _ _ _
  ctus Do -- mi -- nus
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
