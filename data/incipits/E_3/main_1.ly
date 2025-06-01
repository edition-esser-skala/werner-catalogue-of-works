\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \twofourtime \key b \major \time 2/4 \tempoMarkup "Tempo passato"
  b'4.^\partVi \tuplet 3/2 8 { d16 c b }
  b4. \tuplet 3/2 8 { d16 c b } \gotoBar "18"
  \clef soprano \autoBeamOff b4.^\partSs \tuplet 3/2 8 { d16[ c b] }
  b4. \tuplet 3/2 8 { d16[ c b] }
}

text = \lyricmode {
  \skips 8
  La -- ßet
  al -- le
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
