\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key c \dorian \time 4/4 \tempoMarkup "Molto largo"
  r8^\partVi g' g[ as] as4 r
  r8 as16 f g es f d es4*1/2 \gotoBar "6"
    \clef soprano \autoBeamOff g8^\part "Jahel" c4
  r8 g h d16 es f[ g as8]~ as g16[ f]
}

text = \lyricmode {
  \skips 11
  Ô Gott!
  der durch un -- er -- glich -- ne
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
