\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
  c'4.^\partSc c8 d4. d8
  c4 c8 d \grace c b2
  a8[ h] c4 c h
  c
}

text = \lyricmode {
  Ky -- ri -- e e --
  lei -- son, e -- lei --
  son, e -- lei -- _
  son,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
