\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \twofourtime \key f \major \time 2/4 \tempoMarkup "Allegretto passato" \autoBeamOff
  f8.[^\partSs g16] a[ b a b]
  c8[ a] f4
  f'4. f8
  f[ c] a[ f]
}

text = \lyricmode {
  Al -- _
  _ ma
  Re -- dem --
  pto -- ris
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
