\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
  d'4^\partSc d r8 d d d
  d4 d r8 d d d
  d[ h] e4. cis8 fis4~
  fis8[ d] g4. fis8 e4
}

text = \lyricmode {
  Pa -- trem o -- mni -- po --
  ten -- tem, fa -- cto -- rem
  coe -- _ _ _
  li et "ter -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
