\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key g \dorian \time 4/2 \autoBeamOff \tempoMarkup "Alla capella"
    \set Staff.timeSignatureFraction = 2/2
  b'2.^\partSc b4 a1
  g2 r b2. a4
  g2. a8[ b] c4 g c b
}

text = \lyricmode {
  Ve -- lum tem --
  pli scis -- _
  _ _ _ _ sum, _
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
