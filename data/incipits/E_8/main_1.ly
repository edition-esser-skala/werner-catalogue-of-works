\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key g \major \time 4/4 \tempoMarkup "Andante"
  d'4.^\partVi h8 g4. \tuplet 3/2 8 { c16 d e } \gotoBar "8"
  \clef tenor \autoBeamOff d,4.^\partTs h8 g4. \tuplet 3/2 8 { c16[ d e] }
  \appoggiatura e8 d4. c8 \tuplet 3/2 8 { h16[ a g] } g4 \tuplet 3/2 8 { c16[ d e] }
}

text = \lyricmode {
  \skips 6
  Al -- le, die Ver --
  lan -- gen tra -- gen, "Ver -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
