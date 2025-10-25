\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key f \major \time 3/4 \tempoMarkup "Larghetto" \autoBeamOff
    \once \override Staff.TimeSignature.style = #'single-digit
  r4^\partSs r c'
  f c a8[ b]
  c4 f,8[ a] g[ b]
  \tuplet 3/2 4 { a[ g f] } f4 g
}

text = \lyricmode {
  Waß
  helf -- fen mir
  welt -- li -- che
  Freu -- den, die
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
