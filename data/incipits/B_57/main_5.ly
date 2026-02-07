\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key d \minor \time 3/2 \autoBeamOff \tempoMarkup "[no tempo]"
  r2^\partAc d c4 b
  a2 b c
  d4 e \clef soprano d2^\partSc e
  f g a
  b1.
}

text = \lyricmode {
  Be -- ne -- _
  di -- ctus, qui
  "ve -" _ Be -- ne --
  di -- ctus, qui
  "ve -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
