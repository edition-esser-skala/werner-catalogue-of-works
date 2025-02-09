\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key h \minor \time 3/2 \autoBeamOff \tempoMarkup "Larghetto"
  r2^\partTs fis4 d h4. cis16[ d]
  e4 cis ais2.\trill ais4
  h ais h2 r
}



text = \lyricmode {
  Be -- _ ne -- _
  di -- _ ctus, qui
  ve -- _ nit,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
