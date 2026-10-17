\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key e \minor \time 3/4 \autoBeamOff \tempoMarkup "Largo"
    \once \override Staff.TimeSignature.style = #'single-digit
  R2.^\partBs
  r4 e fis
  g4. a8 h4
  e e, fis
  g4. a8 h4
}

text = \lyricmode {
  Ni -- si
  Do -- mi -- nus
  ae -- di -- fi --
  ca -- ve -- rit
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
