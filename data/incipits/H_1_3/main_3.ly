\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key d \minor \time 3/4 \autoBeamOff \tempoMarkup "Andante moderato"
    \once \override Staff.TimeSignature.style = #'single-digit
  a'4^\partAs f8[ d] cis[ e]
  d2 a'4
  b a4. g8
  f[ a16 g] f8[ e] d4
}

text = \lyricmode {
  Be -- a -- tus
  vir qui
  ti -- _ met
  Do -- mi -- num:
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
