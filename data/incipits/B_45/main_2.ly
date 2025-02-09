\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Andante"
  d2^\partSs e
  f f4 a
  c a c b
  a r f^\partSc f
}

text = \lyricmode {
  Glo -- ri --
  a in ex --
  cel -- sis De -- _
  o. Et in
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
