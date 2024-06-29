\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
  r4^\partSs c'8 e d g, g f
  e8. f16 g8 c a c g c
  f,4. e8 d4 r
}

text = \lyricmode {
  Con -- fi -- te -- bor ti -- bi,
  Do -- mi -- ne, in to -- to cor -- de
  me -- _ o.
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
