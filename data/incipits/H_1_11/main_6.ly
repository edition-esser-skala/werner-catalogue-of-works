\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
  c'2^\partSc d4. d8
  e g f e d4. e8
  a,[ d] h[ a16 g] a4.\trill a8
  h4
}

text = \lyricmode {
  Ma -- gni -- fi --
  cat a -- ni -- ma me -- a
  Do -- _ _ mi --
  num,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
