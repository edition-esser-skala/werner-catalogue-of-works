\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key b \major \time 4/4 \autoBeamOff \tempoMarkup "Andante passato"
  \partial 8 b'8^\part "Mazko" b4 b,8 b' b4 b,8 b
  f' f f g16[ a] b4 r8 b,
}

text = \lyricmode {
  Bey Schwabn -- würth bey Schwabn -- würth da
  hed mär Dorf ä Zürd da
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
