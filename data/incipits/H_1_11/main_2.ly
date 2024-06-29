\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key e \minor \time 4/4 \autoBeamOff \tempoMarkup "Andante"
  r8^\partAs h e fis g8. g16 fis4
  e8[ fis16 g] fis8 e dis fis^\partAc h h
  \clef soprano r8^\partSc e h h h e c h
}

text = \lyricmode {
  Lau -- da -- te pu -- e -- ri
  Do -- _ mi -- num: Lau -- da -- te
  Lau -- da -- te no -- men Do -- "mi -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
