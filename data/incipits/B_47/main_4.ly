\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef bass
  \key c \dorian \time 4/4 \autoBeamOff \tempoMarkup "Adagiose"
  c,2^\partBc h4 as'
  \clef alto d^\partAc as' g4. f16[ es]
  \clef soprano d'4^\partSc f4. es16[ d] es8[ d16 c]
}

text = \lyricmode {
  San -- ctus, san
  San -- _ _ ctus,
  San -- _ _ \hy
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
