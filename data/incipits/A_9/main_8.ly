\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key es \lydian \time 3/4 \autoBeamOff \tempoMarkup "Adagio"
    \once \override Staff.TimeSignature.style = #'single-digit
  b4^\part "St: Petrus" es f8[ d]
  es4 r r
  es \tuplet 3/2 4 { b8[ as g] \hA as[ g f] }
  g4 r r
}

text = \lyricmode {
  Ô mei -- ne
  Füeß!
  wie hö -- nig --
  ſüeß
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
