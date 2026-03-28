\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
  r8^\part "Sisera" g d'16 d h! g es'8 c b16 b d \hA b
  g8 g r16 b b c des8. des16 des8 b
  g' e! des c as as r c
}

text = \lyricmode {
  Und Ta -- bor ist be -- dekt mit ze -- hen -- tau -- ſend
  Knech -- ten des fre -- hen Is -- ra -- els, die
  wi -- der mich zu fech -- ten der
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
