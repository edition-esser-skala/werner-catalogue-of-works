\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key g \major \time 4/4 \tempoMarkup "Largo" \autoBeamOff
  g4~^\partTs g16[ h a g] d'8 a h fis
  g16[ fis] g8 g'4. fis16[ e] d[ a] h[ c]
  h[ a] g8 r h a h16 cis d8 fis,
}

text = \lyricmode {
  Al -- _ ma Re -- dem --
  pto -- ris, Re -- dem -- pto -- ris
  Ma -- ter, quae per -- vi -- a coe -- li,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
