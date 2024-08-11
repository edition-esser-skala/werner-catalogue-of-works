\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key a \major \time 3/2 \autoBeamOff \tempoMarkup "Vivace"
  cis'4^\partSs cis2 e4 d cis8[ h]
  cis[ h] cis2 e4 d8[ cis] d[ h]
  cis4 e8[ d] cis4 h a cis
  h2
}

text = \lyricmode {
  Pa -- trem o -- mni -- po --
  ten -- tem, fa -- cto -- rem
  coe -- _ li et ter -- _
  rae,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
