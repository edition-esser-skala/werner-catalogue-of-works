\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key c \dorian \time 4/4 \tempoMarkup "Largo"
  \partial 8 g''8^\partVi c c,16 d es8 es es d r \gotoBar "4"
    \clef bass \autoBeamOff g,,^\partBs
    c c,16[ d] es8 es es[ d] r g
    c, f b, es es[ d] r c
}

text = \lyricmode {
  \skips 8
  Hier
  lig ich in der Bahr, die
  ich vill ban -- ge Jahr mein
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
