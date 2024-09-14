\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key c \major \time 6/2 \tempoMarkup "In chorali" \autoBeamOff
    \set Staff.timeSignatureFraction = 2/2
  g'\breve^\partSc a2 g
  g\breve fis2 e\fermata \bar "||"
  \time 4/2 \tempoMarkup "Alla capella" r2 d'1 d2
  c1 c2 c~
  c b a1~
}

tl = {
  \once \override LyricText.self-alignment-X = #LEFT
  \override LyricSpace.minimum-distance = #1
}

text = \lyricmode {
  \tl "Miserere mei," De -- us,
  \tl "secundum magnam misericordiam" tu -- am.
  Et se --
  cun -- dum mul --
  ti -- "tu -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
