\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key a \minor \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
  r8^\partSs a' e' d16 d c8 d16 e f8 e
  d8. d16 c4 r g'8 fis16[ e]
  dis dis e cis dis4\trill e8 e16^\partSc e cis cis cis cis
}

text = \lyricmode {
  Ma -- gni -- fi -- cat a -- ni -- ma me -- a
  Do -- mi -- num. O -- mnes
  ge -- ne -- ra -- ti -- o -- nes. Qui -- a fe -- cit mi -- hi
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
