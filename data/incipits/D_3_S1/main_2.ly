\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \tempoMarkup "Andante" \autoBeamOff
  c'4^\partSc c8 h \grace h a8. a16 g4
  f'4. e8 e8. d16 d4
  d4. c8 c[ h] h a
}

text = \lyricmode {
  Da pa -- cem, Do -- mi -- ne,
  pa -- cem, Do -- mi -- ne,
  in di -- e -- bus, "di -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
