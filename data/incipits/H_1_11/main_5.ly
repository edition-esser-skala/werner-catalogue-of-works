\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key g \major \time 3/4 \autoBeamOff \tempoMarkup "Moderato"
  h'8.^\partSc c16 d8 h c a
  h h16[ c] d8 h c a
  h h e4. d8
}

text = \lyricmode {
  Do -- mi -- ne, pro -- ba -- sti
  me, et co -- gno -- vi -- sti
  me, tu co -- "gno -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
