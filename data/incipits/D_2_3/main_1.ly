\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \minor \time 4/4 \tempoMarkup "Largo" \autoBeamOff
  a'2^\partSc f'4 d,
  r b'2 a4
  gis2 a8 a e'4~
  e8[ d] d4 r r8 g,
}

text = \lyricmode {
  In mon -- te
  O -- li --
  ve -- ti o -- ra --
  bat, "o -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
