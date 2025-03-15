\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key c \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
  r8^\partBc c c c d4. c16[ d]
  e4. d16[ e] f8[ e16 f] g8 f16 g
  a8 h c e, f[ g16 a] g8[ f]
}

text = \lyricmode {
  Cum San -- cto Spi -- ri -- 
  tu in
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
