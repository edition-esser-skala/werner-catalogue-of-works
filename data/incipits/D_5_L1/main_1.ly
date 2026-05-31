\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key g \dorian \time 2/2 \tempoMarkup "Allabreve"
  R1^\partSc
  d'~
  d2 d
  f1
  c2 d~
  d4 d es2
  c c
}

text = \lyricmode {
  Be -- 
  ne -- 
  di -- 
  ctus Do -- 
  mi -- nus 
  De -- us
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
