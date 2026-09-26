\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \dorian \time 4/4 \autoBeamOff \tempoMarkup "Largo"
  r4 g'2^\partSc c8[ b]
  as[ b16 \hA as] g8[ f] g4 r
  g8 g g16[ fis] g8 \hA fis4 r
}

text = \lyricmode {
  Ho -- mo
  na -- _ tus
  de mu -- li -- e -- re
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
