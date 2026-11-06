\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
  r8^\part "Schullmeiſter" g h16 h c d a8 r16 a c c e d
  h4 r r2
}

text = \lyricmode {
  Al -- lo ſei ſtät und gmach, ſingts mir hiezt al -- li
  nach.
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
