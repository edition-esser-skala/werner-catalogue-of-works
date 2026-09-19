\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "Largo"
  r4^\partSc a' b h
  cis4. cis8 d[ d, d' c]
  b4 d2 c4
}

text = \lyricmode {
  San -- _ ctus,
  san -- ctus, san --
  ctus, san -- ctus,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
