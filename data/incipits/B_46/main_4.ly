\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
  d'4.^\partSc h8 g[ a h c]
  d[ e16 d] c8[ d] e[ d h cis]
  d[ c] h4 a4. d8
}

text = \lyricmode {
  San -- _ _
  _ _ _
  _ ctus, san -- ctus,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
