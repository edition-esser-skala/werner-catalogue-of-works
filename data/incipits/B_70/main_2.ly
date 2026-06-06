\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key g \minor \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
  d'8^\partSc g \tuplet 3/2 8 { d16[ c d] b[ a b] } g8 d' \tuplet 3/2 8 { h16[ a \hA h] g[ f g] }
  c8 b a8.\trill a16 a8 a4 h8
  c4. b8 b4 a
  b8
}

text = \lyricmode {
  Et in ter -- ra pax, in ter -- ra
  pax ho -- mi -- ni -- bus bo -- nae
  vo -- lun -- ta -- _
  tis
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
