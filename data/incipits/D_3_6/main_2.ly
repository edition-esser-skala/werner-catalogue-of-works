\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \minor \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
    \set Staff.timeSignatureFraction = 2/2
  a'1 g2 a
  a f'4 e d cis d2
  cis1 r2 c
  d2. d4 c2 b
}

text = \lyricmode {
  Ie -- ru -- sa --
  lem sur -- _ _ _ _
  ge et
  ex -- u -- e te
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
