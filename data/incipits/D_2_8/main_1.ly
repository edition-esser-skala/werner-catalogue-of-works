\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key c \dorian \time 4/4 \tempoMarkup "Recitativo" \autoBeamOff
  r4^\partAs g'8 g es8. es16 es8 c
  as' as as as as g r g
  g4 d8 es f f as f
}

text = \lyricmode {
  Tra -- di -- de -- runt me in
  ma -- nus im -- pi -- o -- rum, et
  in -- ter in -- i -- quos pro -- "ie -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
