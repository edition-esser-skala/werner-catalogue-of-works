\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key f \major \time 3/2 \autoBeamOff \tempoMarkup "Andante"
  r4^\partSs f a c f2~
  f4 e8([ d)] c4 d b4.\trill b8
  a2 c4. c8 d4 d
}

text = \lyricmode {
  Be -- a -- tus vir __
  qui ti -- met Do -- mi --
  num: Ge -- ne -- ra -- "ti -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
