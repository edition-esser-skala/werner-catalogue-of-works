\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key g \major \time 3/4 \tempoMarkup "[no tempo]" \autoBeamOff
  g'4^\partAs d r
  g8[ d] d4 r
  d8 e16[ fis] g8[ h] \tuplet 3/2 4 { a8[ g fis] }
  g[ fis] g4 h
}

text = \lyricmode {
  Al -- ma
  Ma -- ter,
  Re -- dem -- pto -- ris
  Ma -- ter, quae
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
