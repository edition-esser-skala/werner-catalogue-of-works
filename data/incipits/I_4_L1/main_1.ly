\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef bass
  \key es \major \time 3/2 \tempoMarkup "Andante"
  es,4.^\partOrg f8 g4 as b as
  g \clef treble \autoBeamOff b'^\partSc es4. d8 c4 c
  b b2 c4
}

text = \lyricmode {
  \skips 7
  [Ma -- ter mi -- se -- ri -- 
  cor -- di -- ae]
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
