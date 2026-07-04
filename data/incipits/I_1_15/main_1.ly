\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key c \major \time 3/4 \autoBeamOff \tempoMarkup "Largo"
    \once \override Staff.TimeSignature.style = #'single-digit
  g'4^\partAs c f,
  e8[ d] e4 r
  g8.[ a32 h] c8[ g] g[ f]
  e[ d] e4 r
}

text = \lyricmode {
  Al -- _ ma
  ma -- ter,
  ma -- _ ter
  al -- ma,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
