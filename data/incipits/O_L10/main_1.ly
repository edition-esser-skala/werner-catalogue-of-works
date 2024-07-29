\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key g \minor \time 3/4 \tempoMarkup "[no tempo]"
    \once \override Staff.TimeSignature.style = #'single-digit
  r4 d'2^\partUnk g,8( es') es4 r
  r c2
  f,8 d' d4 r
  r b2
  es,8 c' c4 r
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
