\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key f \major \time 3/2 \autoBeamOff \tempoMarkup "[no tempo]"
  a'2^\partSc g f4 b~
  b a d4. d8 e4 f
  b,4. b8 a4 c d e
}

text = \lyricmode {
  Con -- fi -- te -- _
  bor ti -- bi, ti -- bi,
  Do -- mi -- ne, in to -- to
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
