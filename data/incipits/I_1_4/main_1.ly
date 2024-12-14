\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key a \minor \time 4/2 \tempoMarkup "Alla capella" \autoBeamOff
    \set Staff.timeSignatureFraction = 2/2
  c'1^\partSc c2 c
  d h c c~
  c h4 c d1
  d2
}

text = \lyricmode {
  Al -- ma Re --
  dem -- pto -- ris Ma --
  _ _ _
  ter,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
