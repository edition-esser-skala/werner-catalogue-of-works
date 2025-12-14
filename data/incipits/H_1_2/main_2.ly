\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \major \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
  a'4.^\partSs d8 cis4 d
  h8 g16[ a] h8 cis d8. a16 a8 fis'^\partSc
  e fis d d d d d[ cis]
  d4
}

text = \lyricmode {
  Con -- fi -- te -- bor
  ti -- bi, ti -- bi, Do -- mi -- ne, in
  to -- to, to -- to cor -- de me --
  o,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
