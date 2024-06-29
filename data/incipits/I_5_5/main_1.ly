\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 2/1 \tempoMarkup "Allabreve moderato" \autoBeamOff
    \set Staff.timeSignatureFraction = 2/2
  c'1^\partSc c
  c a2 f
  g2. g4 c,2 r
}

text = \lyricmode {
  Sub tu --
  um prae -- _
  si -- di -- um
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
