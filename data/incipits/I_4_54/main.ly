\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key g \minor \time 3/2 \tempoMarkup "Largo"
  r4^\markup \remark "vl 1" g b d g b
  r g b d g b
  r a, c fis a c
  \clef soprano \autoBeamOff r2^\markup \remark "S solo" d,, d4 e8([ fis)]
  g1 \afterGrace g2( { a8[ b]) }
}

text = \lyricmode {
  \repeat unfold 15 { \skip 4 }
  Sal -- ve Re --
  gi -- na __
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
