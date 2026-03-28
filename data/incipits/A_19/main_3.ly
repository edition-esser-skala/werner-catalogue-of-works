\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
  r8^\part "Debora" g' d' h!16 g es8 es r g16 c
  b8 f as16 c b f g8. g16 g4
  r8 c as16 f d es es8. b16 b4
}

text = \lyricmode {
  Er ſter -- be, er ſter -- be. Di -- ßer
  Schluß, der unß -- re Frey -- heit flüg -- len muß,
  ſoll unſ -- rer Feun -- de Däm -- pfer ſeyn.
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
