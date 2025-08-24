\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \major \time 4/4 \tempoMarkup "Largo" \autoBeamOff
  d'4.^\partSc d8 d4 dis
  e2~ e8[ d16 cis] d8[ e]
  d4. cis16[ h] cis4 r
}

text = \lyricmode {
  Ky -- ri -- e e --
  lei -- _
  _ _ son,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
