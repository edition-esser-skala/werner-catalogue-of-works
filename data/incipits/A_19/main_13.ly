\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
  r8^\partSc a' d4 r8 a e'4
  r8 d d d es4. es8
  d8 d d d f!4. f8
}

text = \lyricmode {
  Ja Held! Ja Held!
  Zeig unß die Groß -- muths
  Weeg, zeig unß die Groß -- muths
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
