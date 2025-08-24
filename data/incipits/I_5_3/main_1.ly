\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \major \time 4/4 \tempoMarkup "Andante" \autoBeamOff
  a'8^\partSs d fis, g a8. d,16 d4
  r8 d' cis16[\trill h] a[\trill g] fis8 d16[ e fis g] a[ h]
  a8[ e'] cis[ a] g4.\trill g8
}

text = \lyricmode {
  Sub tu -- um prae -- si -- di -- um
  con -- fu -- gi -- mus, San -- cta
  De -- i __ Ge -- "ni -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
