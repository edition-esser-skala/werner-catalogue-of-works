\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key d \dorian \time 3/4 \autoBeamOff \tempoMarkup "[no tempo]"
  r4^\partAs f4. f8
  g4 g8[ f] g[ as]
  f4 f r
  r c2
  f2.
}

text = \lyricmode {
  Be -- ne --
  di -- ctus, qui
  ve -- nit
  in
  "no -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
