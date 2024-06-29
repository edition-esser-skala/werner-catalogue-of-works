\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
  c'4.^\partSc h8 e4. c8
  d h a[ d] h4 r8 c~
  c a d[ c16 d] h8 c4 h8
}

text = \lyricmode {
  Fa -- ctus ci -- bus
  vi -- a -- to -- rum, vi --
  a -- "to -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
