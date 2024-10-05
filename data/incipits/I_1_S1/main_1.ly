\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key g \major \time 2/4 \tempoMarkup "Andante"
  d'8[^\partVi d d d]
  \grace d16 c8[ c c c] \gotoBar "18"
  \clef soprano \autoBeamOff d4^\partSc d
  d8 d c16[ h] a[ g]
}

text = \lyricmode {
  \skips 8
  Al -- ma
  re -- dem -- pto -- ris
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
