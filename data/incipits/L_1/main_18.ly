\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \twofourtime \key c \major \time 2/4 \tempoMarkup "Allegro"
  r16^\partVi g c e g c, e g
  c g c e g c, e g
  c8[ g e] \clef tenor \autoBeamOff c,^\part "Hollähippen-Krämer"
  h16[ c] a[ h] g[ a] f[ g]
  e[ d c8] r c' %5
}

text = \lyricmode {
  \skips 18
  Äns
  bitt I mir dö
  auß ä
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
