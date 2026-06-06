\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key g \major \time 4/2 \autoBeamOff \tempoMarkup "Vivace"
    \set Staff.timeSignatureFraction = 2/2
  r1^\partAc r2 g'~
  g fis e2. fis4
  g e g1 fis2
  e r r e
}

text = \lyricmode {
  Be --
  ne -- di -- _
  _ _ _ _
  ctus, qui
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
