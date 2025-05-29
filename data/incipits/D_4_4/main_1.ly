\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key f \major \time 6/8 \autoBeamOff
    \once \omit Staff.TimeSignature
  c\breve*1/16^\partBc d d a' b a\fermata \bar "||"
  \time 4/4 \clef soprano \tempoMarkup "Allegro"
    c'4.^\partSc d16[ e] f8[ c] a[ f]
  d'8.[ es16] f8 \hA es16[ d] c[ b] a[ b] c8 b16[ a]
}

text = \lyricmode {
  Ro -- _ ra -- _ _ te
  Coe -- _ _ li __
  de -- _ su -- per, de -- _ "su -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
