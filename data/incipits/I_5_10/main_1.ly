\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/2 \tempoMarkup "Alla capella" \autoBeamOff
    \set Staff.timeSignatureFraction = 2/2
  g'1^\partSc a2. h4
  c2 c2. c4 h2
  a a1 gis2
  a c1 c2
}

text = \lyricmode {
  Sub tu -- um
  prae -- si -- di -- um
  con -- fu -- gi --
  mus, San -- cta
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
