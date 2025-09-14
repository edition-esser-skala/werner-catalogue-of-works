\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key fis \minor \time 3/4 \autoBeamOff \tempoMarkup "Ordinari"
  r4^\partSs cis'4. a8
  gis4 gis r8 cis
  a4 a r8 cis
  d4. d8 fis[ d]
}

text = \lyricmode {
  Be -- ne --
  di -- ctus, qui
  ve -- nit in
  no -- mi -- ne
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
