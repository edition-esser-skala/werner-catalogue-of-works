\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key b \major \time 3/8 \autoBeamOff \tempoMarkup "Allegretto mà non troppo"
  \partial 8 f8^\part "Barak" \tuplet 3/2 8 { b16[ a b] } d[ c] b[ a]
  b8 b, b'
  \tuplet 3/2 8 { b16[ c b] } a[ g] f[ es]
  d8 b d'
}

text = \lyricmode {
  Fort küh -- ne -- ſte
  Stärk -- he der
  fre -- he -- ſten
  Hel -- den, fort
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
