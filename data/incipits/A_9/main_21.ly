\version "2.24.2"
\include "header.ly"

sbTHOn = {
  \set subdivideBeams = ##t
  \set baseMoment = #(ly:make-moment 1/4)
  \set beatStructure = #'(2 2 2 2 2 2)
}

notes = \relative c' {
  \clef treble
  \key es \lydian \time 3/2 \tempoMarkup "Tempo ordinario"
  \sbTHOn r16^\partVi es es es es es es es g g g g b b b b es es es es g g g g \gotoBar "9"
  \clef bass \autoBeamOff r4^\part "Judex" es,, g r8 b es b g es
    b'4
}

text = \lyricmode {
  \skips 23
  Auf auf, auf auf zum Zorn und
  Rach,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
