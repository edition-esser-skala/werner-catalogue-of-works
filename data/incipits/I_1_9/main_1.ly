\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key a \minor \time 4/4 \tempoMarkup "Largo" \autoBeamOff
  a'2^\partBs gis
  a8 c16[ h] a[ g f e] d4 h'!
  c, a' h, gis'
}

text = \lyricmode {
  Al -- ma
  Re -- dem -- pto -- _ ris,
  Re -- dem -- pto -- ris,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
