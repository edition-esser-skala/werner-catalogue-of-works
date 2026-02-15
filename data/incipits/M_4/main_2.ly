\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key g \minor \time 4/4 \tempoMarkup "Vivace"
  g'2^\partVii es'4 r8 g,
  g fis r d' d cis r f,
  f e r c' c h r es,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
