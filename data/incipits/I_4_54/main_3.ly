\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key b \major \time 3/4 \tempoMarkup "Allegro"
  r8^\partVi b'16 b d d f f b b d d
  c c a a f f c c a a f' f \gotoBar "10"
  \clef bass b,,,4^\partBc d f
  \clef tenor d^\partTc f b
  \clef alto f^\partAc b d
}

text = \lyricmode {
  \skips 22
  Ad te "cla -"
  Ad te "cla -"
  Ad te "cla -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
