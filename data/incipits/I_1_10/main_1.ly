\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key g \minor \time 4/4 \tempoMarkup "Adagio" \autoBeamOff
  d'4~^\partSs d16[ b] g8 r d'~ d16[ fis] g8
  a16[ fis] es![ c] a[ fis] a[ c] \tuplet 3/2 8 { b[ a g] } g8 r4
}

text = \lyricmode {
  Al -- ma Ma -- ter,
  Re -- dem -- pto -- ris Ma -- ter,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
