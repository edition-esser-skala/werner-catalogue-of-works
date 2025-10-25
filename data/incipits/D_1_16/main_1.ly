\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key c \major \time 4/4 \tempoMarkup "Recitativo · Largo" \autoBeamOff
  r8^\partBs c e g c4 g8 c
  a a16 a h8 c c16 g g8 r16 g c g
  f8.[ g32 a] g8 d e16 e e8 c e
}

text = \lyricmode {
  Be -- a -- tus vir qui in --
  ven -- tus est si -- ne ma -- cu -- la, et qui post
  au -- rum non ab -- i -- it nec "spe -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
