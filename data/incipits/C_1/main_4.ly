\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \dorian \time 4/4 \autoBeamOff \tempoMarkup "Largo"
  g'4^\partSc c2 b4
  as g8[ a16 g] fis8 fis4 g16[ a]
  g[ a b8]~ b16[ c d8] es4. es8
}

text = \lyricmode {
  San -- _ _
  _ _ ctus, san -- _
  _ _ ctus,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
