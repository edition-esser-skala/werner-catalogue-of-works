\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key d \minor \time 3/4 \autoBeamOff \tempoMarkup "[no tempo]"
  r4^\partAs a' cis,
  d e f
  e8[ f] g4 d
  cis cis r
}

text = \lyricmode {
  Be -- ne --
  di -- ctus, qui
  ve -- nit, qui
  ve -- nit
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
