\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
  r8^\part "Gerechtigkeit" g c16 c c e h8 h h16 fis a h
  g8 g r16 g h g d'8. d16 d8 e
  f8. f16 f8 e c c r e
}

text = \lyricmode {
  Ge -- denck -- he dan ô Menſch was Gott vor dich muß
  ley -- den und du be -- gibſt dich pur auf
  lau -- ter Yeb -- big -- kei -- ten, "al -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
