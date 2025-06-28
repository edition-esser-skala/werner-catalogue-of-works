\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key e \major \time 6/4 \autoBeamOff \tempoMarkup "Andante"
  e'4^\partSs h cis gis2 a4
  h e, r e8[ gis] h4 cis
  ais h e \tuplet 3/2 4 { dis8[ cis h] } cis2\trill
  h4
}

text = \lyricmode {
  Pa -- trem o -- mni -- po --
  ten -- tem, fa -- cto -- rem
  coe -- li et ter -- _
  rae,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
