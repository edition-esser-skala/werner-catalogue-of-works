\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key b \major \time 3/4 \autoBeamOff \tempoMarkup "Andante"
  b'4^\partSs d2
  c16[ d es8] d[\trill c] b[\trill a]
  b[ a] b4 r
}

text = \lyricmode {
  Be -- ne --
  di -- ctus, qui
  ve -- nit,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
