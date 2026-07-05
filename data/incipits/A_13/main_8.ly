\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
  d8^\part "Adam" r16 d d8 h16 d d8 gis, r h
  c8. c16 c8 h gis8. gis16 gis8 f'
  e c ais8. h16 h8 h16 \clef soprano fis'^\part "Barmherzigkeit" h8 h
}

text = \lyricmode {
  Ach! ſo muß ich dan ſter -- ben? und
  e -- wig -- lich ô Her -- tzens -- ſtich! in
  grö -- ſten Leyd ver -- der -- ben? Halt ein "ver -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
