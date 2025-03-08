\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key f \major \time 4/2 \autoBeamOff \tempoMarkup "Allabreve"
    \set Staff.timeSignatureFraction = 2/2
  c1^\partTc a2 d~
  d c b2. b4
  a2
}

text = \lyricmode {

}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
