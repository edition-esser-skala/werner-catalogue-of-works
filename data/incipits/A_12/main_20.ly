\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
  r8^\part "Jobs Frau" g'16 g c c e c a8 e16 fis g8 h16 a
  fis8 fis r \hA fis16 gis ais8 cis e fis
  d d r h16 fis g8 h h8. fis16
  fis4
}

text = \lyricmode {
  Nun iſt end -- lich al -- les hin, Hauß und Hoff, Schaaf und
  Rün -- der, auch ſo -- gar die eyg -- ne
  Kin -- der, ich weiß nicht mehr wo ich
  bin.
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
