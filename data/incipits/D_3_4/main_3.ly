\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key a \minor \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
  a'2.^\partSc a4
  c2 h4 e~
  e d c2
  h a8[ h] c4~
}

text = \lyricmode {
  Ho -- mo
  qui -- dam fe --
  cit coe --
  nam "ma -" _
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
