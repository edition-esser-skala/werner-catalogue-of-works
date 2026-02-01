\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 3/4 \autoBeamOff \tempoMarkup "Andante passato"
    \once \override Staff.TimeSignature.style = #'single-digit
  r4^\partSc e' e
  d g g
  e e r8 g
  c,4 c4. d16[ e]
}

text = \lyricmode {
  Pa -- trem
  o -- mni -- po --
  ten -- tem, fa --
  cto -- rem __ _
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
