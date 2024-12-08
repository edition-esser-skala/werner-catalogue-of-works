\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key f \dorian \time 4/4 \tempoMarkup "Allegro"
  \partial 8 f'8~^\partVi f e f c16 d es8 es r es~
  es d es b16 c des8 des r \hA des
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
