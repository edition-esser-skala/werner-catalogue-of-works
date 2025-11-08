\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key g \dorian \time 2/2 \autoBeamOff \tempoMarkup "[no tempo]"
  g'1^\partSc
  g2 g
  fis fis
  fis1
  g2 g~
  g g~
  g g
}

text = \lyricmode {
  O -- 
  mnes a -- 
  mi -- ci 
  me -- 
  i, de -- 
  re -- 
  "li -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
