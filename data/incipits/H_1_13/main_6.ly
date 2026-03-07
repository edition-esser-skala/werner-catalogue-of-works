\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 3/4 \autoBeamOff \tempoMarkup "[no tempo]"
    \once \override Staff.TimeSignature.style = #'single-digit
  r4^\partSc c'2
  d4. d8 e4
  d e4. e8
  d2 r4
  r c d8 d
}

text = \lyricmode {
  Ma --
  gni -- fi -- cat,
  ma -- gni -- fi --
  cat
  a -- ni -- ma,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
