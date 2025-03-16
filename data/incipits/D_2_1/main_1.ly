\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key g \major \time 4/4 \tempoMarkup "Recitativo" \autoBeamOff
  r8^\partAs h4 d8 g8. g16 g8 h
  fis4 fis r8 fis fis g16 a
  c,8. c16 c8 c h4 h
}

text = \lyricmode {
  In ec -- cle -- si -- a Fran --
  ci -- scus a Chri -- sto per
  An -- ge -- lum ci -- ta -- tus.
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
