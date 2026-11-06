\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
  r8^\part "Mazko" g' g16 g c g a8. e16 e8 e16 fis
  g8 g a e fis r fis16 g a fis
}

text = \lyricmode {
  Herr Rich -- tär ha -- mär ſcharf -- fe Klagn wi -- der
  Par -- thl vor -- zu -- tragn, Schwabn -- würth mus "Vor -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
