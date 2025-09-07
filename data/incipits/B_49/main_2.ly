\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Andante"
  d8^\partTs a f' e d c b8. b16
  a8 e'4 e8 d16[ c] b8 a \clef soprano a'^\partSs
  b16[ c] d4 c16[ b] a4 r
}

text = \lyricmode {
  Et in ter -- ra pax ho -- mi -- ni --
  bus bo -- nae vo -- lun -- "ta -" Lau --
  da -- _ mus te,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
