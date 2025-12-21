\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key f \major \time 3/4 \tempoMarkup "Largo" \autoBeamOff
    \once \override Staff.TimeSignature.style = #'single-digit
  f4^\partAs a g8[ f]
  e[ d] c4 d8[ e]
  f c b2
  a4 c a'
}

text = \lyricmode {
  A -- ve Re --
  gi -- na, a --
  ve coe -- lo --
  rum, a -- ve
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
