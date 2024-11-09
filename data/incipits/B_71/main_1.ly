\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key f \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
  c4.^\partTc f8 e[ c] d[ b]
  \clef soprano c'4.^\partSc f8 e[ c] d[ b]~
  b[ a16 g] a[ f a b] c8 e, f16[ g a h]
}

text = \lyricmode {
  Ky -- ri -- e __ "e -"
  Ky -- ri -- e __ e --
  lei -- son, e -- "lei -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
