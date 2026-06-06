\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key g \major \time 3/2 \autoBeamOff \tempoMarkup "Vivace moderato"
  h'2^\partSc h h
  g c h
  c e c
  h h c~
  c h e
}

text = \lyricmode {
  Pa -- trem o --
  mni -- po --
  ten -- _ tem, fa --
  cto -- rem coe --
  li, "coe -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
