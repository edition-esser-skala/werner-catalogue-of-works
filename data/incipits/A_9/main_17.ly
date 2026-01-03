\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \twofourtime \key c \dorian \time 2/4 \tempoMarkup "Vivace"
  c16^\partVi c c c c' c c c
  g' g g g g, g g g \gotoBar "13"
  \clef bass \autoBeamOff c,4^\part "Judex" g
  \tuplet 3/2 4 { es8[ d c] } r es'
  d[ h] g[ f]
}

text = \lyricmode {
  \skips 16
  Nun ſoll
  ſich mein
  Rach "auß -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
