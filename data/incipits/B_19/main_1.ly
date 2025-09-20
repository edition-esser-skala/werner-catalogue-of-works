\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \minor \time 4/4 \tempoMarkup "Largo" \autoBeamOff
  d4.^\partSc d8 b'4 r
  r8 g g16([ f) g8] e'4 r
  r8 a, f'( d4) c c8
}

text = \lyricmode {
  Ky -- ri -- e
  e -- lei -- son,
  e -- lei -- son, "e -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
