\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
  g'4^\partSc a8 c h a g[ c]~
  c h c4 r r8 e,
  f16[ g] a[ h] c8 d e16[ d] c8 h a
}

text = \lyricmode {
  Ve -- ni, cre -- a -- tor Spi --
  ri -- tus, men --
  tes tu -- o -- rum vi -- si -- ta, "tu -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
