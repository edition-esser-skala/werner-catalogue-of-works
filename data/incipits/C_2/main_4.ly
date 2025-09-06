\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key d \minor \time 3/4 \autoBeamOff \tempoMarkup "Adagio"
    \once \omit Staff.TimeSignature
  d\breve*1/8^\partBc d c \bar "||"
  \clef soprano \time 4/4 r2^\partSc r4 c''
  c b r d
  d c b2
  b4 a
}

text = \lyricmode {
  San -- tus. __ _
  San --
  ctus, _ san --
  ctus, _ san --
  ctus, _
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
