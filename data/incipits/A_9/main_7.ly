\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
  \partial 2 r4^\part "St: Petrus" g c8. c16 c8 es as,8. as16 as8 f
  d' d d16 d f es c4 r8 es
  b b d \hA b g g r b
}

text = \lyricmode {
  So kom -- me dann, em -- pfang den Lohn, du
  mein ge -- we -- ne -- dey -- ter Leib! Laß
  dich nun -- mehr be -- ſee -- len, man
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
