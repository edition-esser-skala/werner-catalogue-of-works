\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key es \lydian \time 12/8 \tempoMarkup "Allegro"
  es16^\partVi d es f g as b8 b, r es'16 d es f g a b8 b,
    \gotoBar "8" \clef tenor \autoBeamOff b,8^\part "Sisera"
  es b g' es b es b g b g es r
}

text = \lyricmode {
  \skips 16
  Er --
  zütt -- re, er -- ta -- tre, er -- blaſ -- ſe Ver -- weg -- ner!
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
