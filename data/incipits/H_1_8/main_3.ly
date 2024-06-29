\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key e \minor \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
  r8^\partSs h' h8. a16 g8 e' d!16[ c] h[ a]
  h8 a16 g d'8. e16 c8 h a16 g fis e
  h'8 h r4 r2
}

text = \lyricmode {
  Be -- a -- tus vir qui ti -- met
  Do -- mi -- num: In man -- da -- tis e -- ius vo -- let
  ni -- mis.
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
