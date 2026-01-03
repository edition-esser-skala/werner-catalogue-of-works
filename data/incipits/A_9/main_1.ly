\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \key c \dorian \time 4/4 \tempoMarkup "Adagiosè"
  r4 c'2^\partVii h4
  b as2 \fC g'4~^\partVi
  g fis f es~
  es8 es d c h a16 \hA h c8 c,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
