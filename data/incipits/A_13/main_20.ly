\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
  r8^\part "Barmherzigkeit" a' e' g, f d' c16 c g a
  b8 d \hA b8. a16 a8 a \clef tenor r^\part "Gerechtigkeit" c,
  c16 c a c f8 f, d' d r16 d a b
}

text = \lyricmode {
  Ô groſ -- ſer Gott dir danck -- he ich daß
  du mein Bitt er -- hö -- ret. Wan
  du nicht hät -- teſt Gnad ge -- fun -- den ſo wär der
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
