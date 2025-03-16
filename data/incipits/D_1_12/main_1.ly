\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key g \major \time 3/2 \tempoMarkup "Vivace" \autoBeamOff
  \mvTr h'2.^\partSc h4 d2
  h a r
  h a g
  h a1
  h r2
}

text = \lyricmode {
  E -- u -- ge
  ser -- ve
  bo -- ne et
  fi -- de --
  lis,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
