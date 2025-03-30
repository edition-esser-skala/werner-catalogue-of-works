\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key c \major \time 3/4 \tempoMarkup "Andante" \autoBeamOff
  g'4^\partAs c,8[ e] d[ f]
  e[ g] c4 g
  \grace g8 f2 e4
  g f e
  d2
}

text = \lyricmode {
  Re -- gi -- na
  coe -- li, lae --
  ta -- re,
  al -- le -- lu --
  ia,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
