\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \major \time 4/2 \autoBeamOff \tempoMarkup "Allabreve moderato"
    \set Staff.timeSignatureFraction = 2/2
  d1^\partSc d
  d2 d d d
  d fis a a
  a1
}

text = \lyricmode {
  Sub tu --
  um prae -- si -- di --
  um con -- fu -- gi --
  mus,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
