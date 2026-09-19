\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \major \time 3/4 \autoBeamOff \tempoMarkup "Vivace"
    \once \override Staff.TimeSignature.style = #'single-digit
  a'4^\partSs d,8 d' cis h
  a8.[ g16] fis8 a d a
  h cis16 d g,4. fis8
  e4 r r
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
