\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
  r8^\part "Mazko" d16 d fis8 a h8. h,16 h4
  fis'8. fis16 a8 h g8. g16 g8 r
}

text = \lyricmode {
  Ha -- mär ſchon bald fin -- ſter Nacht,
  iſt mär no koä Rich -- ter gmacht.
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
