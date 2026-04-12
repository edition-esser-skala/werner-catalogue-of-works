\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
  es'8^\part "Jahel" b r16 des f es c8. c16 c4
  r8 c, e! f g8. g16 g8 as
  b b des c as4 r
}

text = \lyricmode {
  Ster -- be! ver -- ruch -- ter Hoch -- mueths -- geiſt!
  weil Gott der Hel -- den Herr dich
  al -- ſo ſter -- ben heiſt.
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
