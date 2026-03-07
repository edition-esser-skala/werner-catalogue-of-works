\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
  d'4.^\partSc d8 d4 d
  h8 e d8. d16 d4 r
  r8 h h cis16[ d] e8 e d4~
}

text = \lyricmode {
  Con -- fi -- te -- bor
  ti -- bi, Do -- mi -- ne,
  in to -- to cor -- de "me -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
