\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key a \minor \time 4/4 \tempoMarkup "Andante" \autoBeamOff
  r2^\partSs r8 e' e e
  e4 e, r8 a gis a16[ h]
  a4 h8 a16[ gis] a4 r8 a
}

text = \lyricmode {
  Be -- a -- ti
  o -- mnes qui ti -- ment
  Do -- _ mi -- num, qui
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
