\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key c \dorian \time 4/4 \tempoMarkup "Largo"
  r4^\partVi r8 h' c16 es g f g8 es
  es[\trill d] \gotoBar "8" \clef bass \autoBeamOff r8^\partBs g,, c es16[ d] c8 g
  es c r g' as c b, as'
}

text = \lyricmode {
  \skips 9
  So ſey es dan be --
  ſchloſ -- ſen, weil ſich der Sün -- der
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
