\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
  r8^\part "Sagfäller" d f a a16 e e e g8 a16 e
  f8 r16 d d d d e fis8 fis a16 a c b
}

text = \lyricmode {
  Mei ſchö -- ni Kunſt hat Ar -- chi -- me -- des er --
  denckt und hätt ſi beym Stu -- dirn döß Werckh recht aus -- "zu -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
