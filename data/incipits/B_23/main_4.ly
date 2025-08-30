\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key a \minor \time 4/2 \autoBeamOff \tempoMarkup "Molto moderato"
    \set Staff.timeSignatureFraction = 2/2
  a'1^\partSc a
  h a
  \clef tenor c,^\partTc c
  d c
}

text = \lyricmode {
  Be -- ne --
  di -- ctus,
  be -- ne --
  di -- ctus,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
