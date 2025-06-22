\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key e \minor \time 4/4 \autoBeamOff \tempoMarkup "Andante"
  h'2^\partSs h4. cis16 dis
  e8 d16 c h8. a16 g8. fis16 e8 e'
  d! a16[ h] c[ h] c8 h c16 d e8[ g,]
}

text = \lyricmode {
  Ma -- gni -- fi -- cat
  a -- ni -- ma me -- a Do -- mi -- num, et
  ex -- ul -- ta -- vit spi -- ri -- tus "me -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
