\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \tempoMarkup "Recitativo" \autoBeamOff
  r16^\part "Jobs Frau" a' a a a e g a f8 f \clef tenor r^\part Job a,
  c! c c16 c es d b8 b \fC r^\part Eliphas d
  d a c d h8. h16 h8
}

text = \lyricmode {
  So iſt dan al -- les Leyd ver -- ſchwun -- den? Die --
  weill ich wie -- der Gnad ge -- fun -- den. Ein
  ſel -- za -- me Ver -- en -- de -- rung.
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
