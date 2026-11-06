\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
  g8.^\part "Schullmeiſter" g16 c8 e h h d d16 e
  c8 c g g16 a b8. b16 c8 g
}

text = \lyricmode {
  Kin -- der lährnts bräf drauf und ſagts mär bald
  auf, I kan enkh nit län -- ger mehr "da -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
