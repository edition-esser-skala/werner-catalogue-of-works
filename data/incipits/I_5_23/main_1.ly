\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key a \minor \time 4/4 \tempoMarkup "Andante" \autoBeamOff
  e4^\partAs f e d
  c8 d4 h8 \clef soprano a'4^\partSs c
  h a g8 a4 fis8
  e4 r r8 d' d c!16[ h]
}

text = \lyricmode {
  Sub tu -- um prae --
  si -- _ "di -" Sub tu --
  um prae -- si -- _ di --
  um con -- fu -- "gi -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
