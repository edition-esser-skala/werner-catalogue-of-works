\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key c \dorian \time 4/4 \autoBeamOff \tempoMarkup "Largo"
  c4.^\partTc es8 d g, g f
  es c c'4. h16[ a] h4
  c4 r r8 d d c16 d
}

text = \lyricmode {
  Al -- ma Re -- dem -- pto -- ris
  ma -- ter, al -- _ _
  ma, quae per -- vi -- a
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
