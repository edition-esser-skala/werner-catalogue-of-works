\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key g \major \time 4/4 \tempoMarkup "Allegretto"
  g'8^\partVi h~ h cis16 d a8 cis, d e16 fis \gotoBar "16"
  \clef bass \autoBeamOff g,4.^\part Schöpffer h8 a[ cis,] d[ e16 fis]
  g4. g8 g4 fis
}

text = \lyricmode {
  \skips 9
  Ich, der Schö -- pffer
  al -- ler Din -- gen,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
