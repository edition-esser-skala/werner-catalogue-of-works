\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key c \dorian \time 3/4 \autoBeamOff \tempoMarkup "Adagio"
    \once \override Staff.TimeSignature.style = #'single-digit
  g4^\part Leviathan es' h
  c8.[ b32 a] g4. f8
  es4 r r
}

text = \lyricmode {
  Umb di -- ße
  ſchö -- _ ne
  Beuth
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
