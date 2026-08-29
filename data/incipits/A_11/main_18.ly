\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key d \dorian \time 4/4 \tempoMarkup "Andante"
  r4^\partVi d'8 cis d a' g f
  e a,16 h c8 h a[ c'] \gotoBar "8" \clef alto \autoBeamOff
    d,,8^\part "Der verlohrene Sohn" cis
  d a' g f e4 a,8 e'
}

text = \lyricmode {
  \skips #13
  Nun bin
  ich ſchon wohl ge -- tröſt daß mein
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
