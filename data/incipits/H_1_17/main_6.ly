\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
  r8^\partSs g' d' e16 fis g8 fis16 e d8.\trill c16
  h a g8 r4 r8 d' d16[ cis] g'8
  fis d r4 r2
}

text = \lyricmode {
  Ma -- gni -- fi -- cat a -- ni -- ma me -- a
  Do -- mi -- num, Qui -- a re --
  spe -- xit
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
