\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key a \minor \time 4/4 \tempoMarkup "Larghetto" \autoBeamOff
  a16[^\partBs h] c[ d] e[ h'] gis e c'8 a, r4
  r8 c f g16 a h,[ c] d e \tuplet 3/2 8 { f[ g a] } g[ f]
  e4
}

text = \lyricmode {
  Be -- ne -- di -- ctus, qui ve -- nit,
  qui ve -- nit in no -- mi -- ne Do -- mi --
  ni,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
