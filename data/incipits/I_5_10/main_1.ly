\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/2 \tempoMarkup "Alla capella" \autoBeamOff
    \set Staff.timeSignatureFraction = 2/2
  g'1^\partSc a2. h4
  c2 c c h
  a a a gis
  a c1 c2
}

text = \lyricmode {
  Sub tu -- _
  um prae -- si -- di --
  um con -- fu -- gi --
  mus, San -- cta
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
