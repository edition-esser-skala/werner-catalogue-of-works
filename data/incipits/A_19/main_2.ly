\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key g \dorian \time 4/4 \autoBeamOff \tempoMarkup "Ariose"
  r8^\partSc d' d d es4 r
  r8 d g d cis4 r
  r8 c a' c, h4 r
}

text = \lyricmode {
  Gott Is -- ra -- el,
  blikh auf daß Joch,
  blikh auf daß Joch,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
