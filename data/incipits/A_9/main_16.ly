\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key c \major \time 4/4 \tempoMarkup "Recitativo" \autoBeamOff
  \partial 2 r8^\part "Judex" f b16 b d \hA b
  g8 g h16 g d f es8 es16 es g g g c
  b8 b r16 g fis g g8. d16 d4
}

text = \lyricmode {
  Woll -- an die Zeit rueckht
  an, daß ich mich all -- gmach rä -- che, daß Ur -- theil je -- den
  ſpre -- che wie er ver -- die -- net hat.
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
