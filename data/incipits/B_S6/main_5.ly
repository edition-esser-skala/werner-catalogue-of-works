\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \twofourtime \key g \major \time 2/4 \tempoMarkup "Allegro"
  g'4^\partVi h8. c16
  d a fis d d'8. e32( fis) \gotoBar "26"
  \clef tenor \autoBeamOff g,,4^\partTs h8.[ c16]
  d8 d4 c8
  h[ a16 h] c[ h] a[ g]
}

text = \lyricmode {
  \skips 9
  Be -- ne --
  di -- ctus, qui
  ve -- nit, qui
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
