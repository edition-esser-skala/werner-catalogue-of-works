\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key g \minor \time 3/2 \autoBeamOff \tempoMarkup "Vivace"
  d2^\partAs g8[ a] b4 a g
  fis2 g4 \clef tenor b,8[^\partTs a] g[ a b c]
  \tuplet 3/2 4 { d[ es f] es[ d c] } b4 a b r
}

text = \lyricmode {
  Pa -- trem o -- mni -- po --
  ten -- tem, rem coe --
  li et ter -- _ rae,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
