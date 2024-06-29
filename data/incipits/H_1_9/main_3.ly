\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key f \major \time 4/4 \tempoMarkup "Presto" \autoBeamOff
  c'2^\partSc d4 h
  c8[ b] a[ g] f[ e] d4
  c r r2
}

text = \lyricmode {
  Be -- a -- tus
  vir, be -- a -- tus
  vir,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
