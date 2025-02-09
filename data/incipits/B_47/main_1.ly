\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key f \major \time 3/8 \tempoMarkup "Andante" \autoBeamOff
  c8[^\partTs b16 a] g[ f]
  d'8 \grace d c4
  f,8[ g] a
  b g c
  a f r
}

text = \lyricmode {
  Be -- ne --
  di -- ctus,
  be -- ne --
  di -- ctus, qui
  ve -- nit,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
