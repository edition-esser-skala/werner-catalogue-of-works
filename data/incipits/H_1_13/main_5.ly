\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key f \major \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
  c'4^\partSs d c b8. b16
  a8 f'4 e8 d4 c
  r2 r8 c4 h8
}

text = \lyricmode {
  Lau -- da -- te Do -- mi --
  num, o -- mnes gen -- tes,
  Quo -- "ni -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
