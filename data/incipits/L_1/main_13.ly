\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
  r8^\part "Savoiard" r16 f, b16. b32 b16 c d8 d r d16 f
  a,8 a16 c es8 es16 d b4 r8 f
}

text = \lyricmode {
  Al -- lo al -- le -- gra -- men -- to! wer guck
  in die La -- ter -- na ma -- gic da
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
