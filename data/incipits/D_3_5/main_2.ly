\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \minor \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
  a'2^\partSc f' e
  d1 cis2
  d d,2. e4
  f2 e e
  d1 r2 %5
}

text = \lyricmode {
  Da pa -- cem,
  Do -- mi --
  ne, pa -- _
  cem, Do -- mi --
  ne,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
