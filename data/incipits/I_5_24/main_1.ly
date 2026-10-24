\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Alla breve · Allegro"
  g'2^\partSc a
  g4 c c h
  a d d cis
  d2 r
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
