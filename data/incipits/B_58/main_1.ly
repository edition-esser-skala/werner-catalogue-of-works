\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key b \major \time 4/4 \autoBeamOff \tempoMarkup "Ariose"
  r8^\partTs b4 c16[ d] g,8 c4 d16[ es]
  a,8 d4 es16[ f] b,8 \tuplet 3/2 8 { es16[ d c] } b8[ a] \gotoBar "5"
  \clef soprano b'4.^\partSs c16[ d] g,8 c4 d16[ es]
  a,8 d4 es16[ f] b,8[ c16 d] c8.[ b16]
}

text = \lyricmode {
  Ky -- ri -- e e -- _
  lei -- _ _ son, e -- "lei -"
  Ky -- ri -- e e -- _
  lei -- _ _ _ \hy
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
