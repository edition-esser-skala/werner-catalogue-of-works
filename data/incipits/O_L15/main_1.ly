\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key b \major \time 3/4 \tempoMarkup "[no tempo]"
    \once \override Staff.TimeSignature.style = #'single-digit
  b'8^\partUnk d4 f a8
  b a16 g f g f es d es d c
  b8 d,4 f a8
  b a16 g f g f es d es d c
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
