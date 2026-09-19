\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key d \major \time 3/4 \autoBeamOff \tempoMarkup "Larghetto"
    \once \override Staff.TimeSignature.style = #'single-digit
  r4^\partAs fis fis
  fis2.
  fis4. g8 fis[ e]
  d[ cis16 d] h4 r8 cis
}

text = \lyricmode {
  Be -- ne --
  di --
  ctus, __ _ qui
  ve -- nit in
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
