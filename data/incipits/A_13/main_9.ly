\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key c \dorian \time 3/4 \autoBeamOff \tempoMarkup "Largo"
    \once \override Staff.TimeSignature.style = #'single-digit
  c4^\part "Adam" es32[ d c8.] h8[ d]
  c2 d4
  es8[ d16 c] b!4 as
  \appoggiatura as8 g2 r4
}

text = \lyricmode {
  Ô waß muß
  dan ô
  groſ -- _ ſer
  Gott
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
