\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key d \minor \time 3/4 \tempoMarkup "Largo"
  r4^\partVi a' a
  r f' f
  r b b
  r es, es
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
