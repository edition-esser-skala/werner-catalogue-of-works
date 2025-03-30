\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key f \major \time 4/2 \tempoMarkup "Allabreve" \autoBeamOff
    \set Staff.timeSignatureFraction = 2/2
  a'1^\partSc a2 b~
  b a g2. g4
  fis1 r2 b
  d b f'! f
}

text = \lyricmode {
  Sub tu -- um __
  prae -- si -- di --
  um con --
  fu -- gi -- mus, "con -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
