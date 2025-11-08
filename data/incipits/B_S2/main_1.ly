\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key c \major \time 4/4 \tempoMarkup "Adagio maestoso"
  g'4.^\partVi a16 g f4 e 
  c'4. d16 c h4 a \gotoBar "9"
  \clef soprano \autoBeamOff c2.^\partSc cis4
  d r r2
}

text = \lyricmode { 
  \skips 10
  Ky -- ri -- 
  e 
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
