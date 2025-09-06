\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key d \minor \time 4/4 \tempoMarkup "Adagio"
  d4.^\partVii f8 e a, e' e
  \fC a4.^\partVi c8 h e, \hA h' h
  c a e'4. f8 \clef soprano \autoBeamOff d,4^\partSs
  e2 f
  g a4 a
}

text = \lyricmode {
  \skips 16
  Be --
  ne -- di --
  _ ctus, qui
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
