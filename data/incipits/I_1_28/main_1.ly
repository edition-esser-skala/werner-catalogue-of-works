\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \twotwotime \key f \major \time 4/2 \tempoMarkup "[no tempo]"
    \set Staff.timeSignatureFraction = 2/2
  r4^\partVii f f f g2 c,
  b'1~ b4 a8 g a4 f \gotoBar "9"
  \clef bass \autoBeamOff f,1^\partBs g2 c,~
  c b' a f %10
  d'1 c
}

text = \lyricmode {
  \skips 10
  Al -- ma Re --
  dem -- pto -- ris
  Ma -- ter,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
