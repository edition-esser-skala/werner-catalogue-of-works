\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key f \lydian \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
    \set Staff.timeSignatureFraction = 2/2
  r1^\partTc c~
  c4 h g2 a2. h4
  c1*1/2 \clef soprano c'2.^\partSc h4 g2
  a h c4 g c2~
  c h c1
}

text = \lyricmode {
  San --
  _ _ _ _
  ctus, San -- _ _
  _ ctus, san -- _ _
  _ ctus,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
