\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key b \major \time 3/2 \tempoMarkup "Vivace"
    \override TupletBracket.tuplet-slur = ##t
    \override TupletBracket.bracket-visibility = #'if-no-beam
    \tupletDown
  \tuplet 3/2 2 { d'4^\partVi f b f d b d c f, }
  b2 r r
  \tuplet 3/2 2 { f'4 d b' f d f es c a }
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
