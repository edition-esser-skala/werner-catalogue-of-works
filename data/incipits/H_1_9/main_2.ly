\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key b \major \time 3/2 \autoBeamOff \tempoMarkup "Andante"
  b'1^\partSs c4 d
  c b a g f es
  d2. es4 f g8[ a]
  b2. c4 d es
}

text = \lyricmode {
  Con -- fi -- _
  te -- bor ti -- _ bi, __ _
  Do -- mi -- ne, in
  to -- to cor -- de
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
