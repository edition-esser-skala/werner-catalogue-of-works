\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key d \dorian \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
  r8^\partAc d d cis d f e8. e16
  d8 f8. f16 e d c[ d] e[ f] g[ d g8]~
  g16[ a f d] e4. d8 e16[ h e8]
}

text = \lyricmode {
  Qui -- cum -- que Chri -- stum quae -- ri --
  tis o -- cu -- los in al -- tum tol --
  _ _ \hy
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
