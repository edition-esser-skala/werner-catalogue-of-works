\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
  c'4.^\partSs c8 h a g f
  e4 fis g r
  r8 c c c16 c h8 d g, d'
}

text = \lyricmode {
  Al -- ma re -- dem -- pto -- ris
  ma -- _ ter,
  quae per -- vi -- a coe -- li por -- ta
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
