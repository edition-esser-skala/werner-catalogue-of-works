\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key c \major \time 4/4 \tempoMarkup "Adagio"
  r8^\part "clno 1" c e g c e, g c
  \clef soprano \autoBeamOff c4.^\partSc c8 d4 d
  e2 d
}

text = \lyricmode {
  \skips 7
  Ky -- ri -- e e -- 
  lei -- son
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
