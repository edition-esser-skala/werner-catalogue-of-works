\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \major \time 3/4 \autoBeamOff \tempoMarkup "Vivace"
    \once \override Staff.TimeSignature.style = #'single-digit
  r8^\partSc a'4 g16[ fis] h8[ a]
  d a4 g16[ fis] h8[ a]
  d a4 g fis8
  e4 r8 cis'4 a8
}

text = \lyricmode {
  San -- _ _
  _ _ _ _
  _ _ _ _
  ctus, san -- ctus,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
