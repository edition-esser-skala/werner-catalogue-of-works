\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key d \minor \time 4/4 \tempoMarkup "Largo"
  a'4^\partVii f'~ f8 e g b
  cis,4 d8 e \fC a,4^\partVi f'~
  f8 e g b~ b a16 g f g e8
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
