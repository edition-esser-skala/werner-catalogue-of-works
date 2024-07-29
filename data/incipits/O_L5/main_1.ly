\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key d \minor \time 4/4 \tempoMarkup "[no tempo]"
  f8.^\partUnk g16 \tuplet 3/2 8 { a f e f[ d e] } cis8 e' \tuplet 3/2 8 { e16 d cis b![ a g] }
  f8 a a16. b32 c16. d32
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
