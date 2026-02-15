\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \dorian \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
  a'4.^\partSs f8 b a d c
  b8. b16 a4 r2
  r8 d4 cis8 d8. a16 a4
}

text = \lyricmode {
  Et in ter -- ra pax ho --
  mi -- ni -- bus,
  ad -- o -- ra -- mus te,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
