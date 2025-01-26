\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key g \minor \time 4/4 \tempoMarkup "Andante passato"
  g'16.^\partVi g32 b16. g32 d'16. d32 f16. d32 g8 g, r16 b' g16. d32 \gotoBar "5"
  d2\fermata \clef soprano \autoBeamOff d4.^\partSc d8 %5
  d4 r r d
  es2. d8 d
}

text = \lyricmode {
  \skips 14
  Ky -- ri --
  e e --
  lei -- son, "e -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
