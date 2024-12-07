\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \dorian \time 4/2 \autoBeamOff
    \set Staff.timeSignatureFraction = 2/2
  a'1.^\partSc a2
  a1 d,2 d'
  c2. c4 c2 a~
  a4 a a2 a1
}

text = \lyricmode {
  O quam
  sua -- vis est,
  Do -- mi -- ne, spi --
  ri -- tus "tu -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
