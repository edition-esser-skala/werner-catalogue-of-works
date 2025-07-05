\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Largo"
  c'4.^\partSc c8 d4. e16[ d]
  c8[ a] c4 h d
  cis d h c~
  c8 d4 e f g8
}

text = \lyricmode {
  San -- ctus, san -- _
  _ _ ctus, san --
  _ ctus, san -- _
  _ _ _ ctus,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
