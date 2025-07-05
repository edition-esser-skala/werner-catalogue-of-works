\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
  f4.^\partAs g16[ a] g8 c, r4
  r8 c f g16 a d,[ c] d8 r b'16[ g]
  e[ d] e8 r f d e16 f \appoggiatura c b8. a16
}

text = \lyricmode {
  Be -- ne -- di -- ctus,
  qui ve -- nit, qui ve -- nit, qui
  ve -- nit in no -- mi -- ne Do -- "mi -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
