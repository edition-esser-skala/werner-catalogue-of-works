\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key c \major \time 4/4 \tempoMarkup "Vivace"
  \partial 8 g'8^\partVi c8 g16 c e8 c16 e g8 e c a'
  g e c g' f16 g e g f g d f
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
