\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
  r4^\part "St: Michael" r8 b es es g \hA es
  c8. c16 c8 e g g b as
  f8. f16 f8 f f c es f
}

text = \lyricmode {
  Be -- rei -- thet euch nun
  all -- zu -- gleich, die ihr al -- hier ver --
  ſam -- blet ſeyd, es kom -- met ſchon der
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
