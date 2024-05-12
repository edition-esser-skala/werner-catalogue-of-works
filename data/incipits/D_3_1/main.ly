\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key g \dorian \time 4/2
    \set Staff.timeSignatureFraction = 2/2
  b'\breve~^\partSc
  b2 a4 g a1\fermata
  b\breve~
  b2 a4 g a1\fermata
}

text = \lyricmode {
  Ec --
  _ _ ce,
  ec --
  _ _ ce
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
