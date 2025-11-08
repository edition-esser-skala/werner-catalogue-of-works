\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \major \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
  a'4^\partSc h a8. a16 d4~
  d cis h4. h8
  a4 r r2
}

text = \lyricmode {
  Ky -- ri -- e e -- lei -- 
  _ _ _ 
  son,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
