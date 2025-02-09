\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key d \major \time 3/2 \autoBeamOff \tempoMarkup "Andante"
  d2^\partAs a'4 h fis8[ g] fis[ g]
  a4 d,8 d e4 \clef soprano a^\partSs h cis
  d2 cis8[ d cis d] e4 d
  cis h a2 r
}

text = \lyricmode {
  Pa -- trem o -- mni -- po --
  ten -- tem, fa -- "cto -" Fa -- cto -- rem
  coe -- li __ _ et
  ter -- _ rae,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
