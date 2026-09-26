\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \dorian \time 4/4 \autoBeamOff \tempoMarkup "Adagiose"
  c'4.^\partSc g8 as4 as
  g8 g c[ d] es4 d
  c4. c8 b16[ c des8] c[ b]
}

text = \lyricmode {
  Re -- _ _ qui --
  em ae -- ter -- _ _
  nam, ae -- ter \hy
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
