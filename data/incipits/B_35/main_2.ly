\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
  d'8.^\partSc c16 h4. a8 g4~
  g8 fis e8. e16 fis8 a h4~
  h8 g4 a fis g8~
}

text = \lyricmode {
  Et in ter -- ra pax __
  ho -- mi -- ni -- bus bo -- nae __
  vo -- lun -- ta -- \hy
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
