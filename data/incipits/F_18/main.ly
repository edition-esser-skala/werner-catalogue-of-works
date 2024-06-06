\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key b \major \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
  b'2^\partSc c a4 f
  r b c d es4. es8
  d4 f es es c4. c8
  b2
}

text = \lyricmode {
  Tri -- stes e -- rant,
  e -- rant A -- po -- sto --
  li, e -- rant A -- po -- sto --
  li,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
