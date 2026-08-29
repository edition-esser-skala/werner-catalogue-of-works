\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
  r4^\part "Der verlohrene Sohn" d d8 d d es
  c4 r8 c c es d a
  b b r \hA b b b b c
}

text = \lyricmode {
  Wo wend ich mich nun
  hin! die Noth hat mich umb --
  ge -- ben, ich bin von al -- ler
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
