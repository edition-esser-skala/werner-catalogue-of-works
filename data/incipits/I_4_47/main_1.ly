\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key d \major \time 2/4 \tempoMarkup "Allegro" \autoBeamOff
  r8^\partTs a d cis
  d d, d'4~
  d8 cis16[ h] a[ g fis e]
  fis8 d r4
}

text = \lyricmode {
  Re -- gi -- na
  sal -- ve, sal --
  ve ma --
  _ ter,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
