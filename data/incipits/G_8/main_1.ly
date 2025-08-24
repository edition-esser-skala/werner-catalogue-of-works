\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key c \major \time 4/4 \tempoMarkup "Allegretto"
  c8^\partVi \tuplet 3/2 8 { e16 d c } g'8 \tuplet 3/2 8 { h16 a g } c8 \tuplet 3/2 8 { e16 d c } c'4~
  c16 a g f e d c h \clef soprano \autoBeamOff c8.^\partSc c16 e8 e
  d d r d^\p es f4 \hA es8
  d
}

text = \lyricmode {
  \skips 20
  Ky -- ri -- e e --
  lei -- son, e -- lei -- _ _
  son,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
