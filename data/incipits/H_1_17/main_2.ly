\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "Andante"
  a'8^\partSs c16[ h] a8 gis \tuplet 3/2 8 { a16[ h c] h[ c d] } c8.\trill c16
  h4 r r2
  r8 c4^\partSc h8 e e16 e d8 c
}

text = \lyricmode {
  Con -- fi -- te -- bor ti -- bi, Do -- mi --
  ne,
  Ex -- qui -- si -- ta in o -- mnes
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
