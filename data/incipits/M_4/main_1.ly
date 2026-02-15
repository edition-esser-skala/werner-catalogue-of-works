\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key g \minor \time 3/2 \tempoMarkup "Larghissimo"
  g'4^\partVii a b h c cis
  \fC r^\partVi d es e f fis
  g8 f es4 d2. cis4
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
