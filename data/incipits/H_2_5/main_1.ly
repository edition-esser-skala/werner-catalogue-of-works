\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key d \major \time 3/4 \tempoMarkup "[no tempo]" \autoBeamOff
  a'4^\partAs d, e
  fis8[ e] d4 r
  R2.
  a'4 d, e
  fis8[ e] d4 r
}

text = \lyricmode {
  Be -- a -- ti
  o -- mnes,

  be -- a -- ti
  o -- mnes
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
