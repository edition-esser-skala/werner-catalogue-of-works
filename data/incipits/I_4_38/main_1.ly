\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key a \minor \time 4/4 \tempoMarkup "Adagio" \autoBeamOff
  r4^\partTs e~ e8.[ f16] e[ d c32 h a gis]
  a4 r8 a e'16[ dis] e8 e16[ h] h[ d]
  c[ h] c8 r c c4~ c16[ h] d[ a]
}

text = \lyricmode {
  Sal -- _
  ve Re -- gi -- na, sal -- ve
  ma -- ter mi -- se -- "ri -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
