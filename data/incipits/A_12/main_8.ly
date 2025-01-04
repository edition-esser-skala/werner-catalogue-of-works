\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
  r8^\part Leviathan b es16 \hA b c des c8 c r g16 a
  b8 b d! c a a r a16 h
  cis8. cis16 d8 e! f, f r f16 g
}

text = \lyricmode {
  Weil mir dan Gwald ge -- ge -- ben, mei -- ne
  Hand an Job zu ſtreck -- hen, werd ich
  ihn an al -- len Eck -- hen mör -- "der -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
