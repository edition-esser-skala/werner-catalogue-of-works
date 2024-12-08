\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key e \minor \time 3/4 \tempoMarkup "Largo"
  \override Staff.TimeSignature.style = #'single-digit
  g'4^\partVi a r8 r16 gis
  a4 a, r
  c' d r8 r16 cis
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
