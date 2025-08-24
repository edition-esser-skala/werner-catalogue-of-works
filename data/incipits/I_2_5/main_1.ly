\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 2/4 \tempoMarkup "Andante" \autoBeamOff
  g'8^\partSs c4 \tuplet 3/2 8 { d16[ c h] }
  c8 c~ \tuplet 3/2 8 { c16[ d e] d[ c h] }
  c8 c, r4
}

text = \lyricmode {
  A -- ve Re --
  gi -- na __ coe --
  lo -- rum,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
