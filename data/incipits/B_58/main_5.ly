\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key g \minor \time 3/4 \autoBeamOff \tempoMarkup "Larghetto"
  d4^\partTs b a
  \clef alto g'^\partAs es d
  c b8[ a] b4
  b8[ a] a4 r
}

text = \lyricmode {
  Be -- _ ne --
  Be -- _ ne --
  di -- ctus, qui
  ve -- nit,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
