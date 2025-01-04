\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
  a'8^\part "Jobs Frau" a f' d b8. b16 b8 g
  cis cis e g, f f a4
  r8 a a16 a c a gis8 h! e c
}

text = \lyricmode {
  Ô daß gro -- ße Her -- tzen -- leyd ſo
  mei -- ne Seel em -- pfün -- det, wie,
  hab ich mich dan vil -- leicht geg’n Gott ſo
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
