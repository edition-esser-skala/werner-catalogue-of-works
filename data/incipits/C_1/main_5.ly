\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key es \lydian \time 3/4 \tempoMarkup "Largo"
    \once \override Staff.TimeSignature.style = #'single-digit
  b'8^\partVi es b g f as
  g4 r r \gotoBar "14"
  \clef soprano \autoBeamOff b4.^\partSs es8 d16[ es f8]
  es[ d] es4 r
}

text = \lyricmode {
  \skips 7
  Be -- _ ne --
  di -- ctus,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
