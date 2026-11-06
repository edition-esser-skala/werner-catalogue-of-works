\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Tempo ordinario"
  r4^\part "Schwabnwürth" g h8 g c4
  r8 a h h r g a a
  fis g g[ fis] g4 r
}

text = \lyricmode {
  C a s cas
  t i ti r i ri
  ti ri ti ri
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
