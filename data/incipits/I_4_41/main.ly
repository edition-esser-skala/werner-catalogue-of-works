\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key g \minor \time 4/4 \tempoMarkup "Largo" \autoBeamOff
  g'8[^\partBs b16 a] g4. b16[ a] g4~
  g8[ b16 a] g8 d b g r4
  r2 r8 b f'4~
  f8 e16[ d] e4 f8 a16[ g] f4
}

text = \lyricmode {
  Sal -- _ _ _
  ve Re -- gi -- na,
  Re -- gi --
  na sal -- ve, "sal -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
