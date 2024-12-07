\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef bass
  \key d \dorian \time 4/2 \tempoMarkup "Alla breve" \autoBeamOff
    \set Staff.timeSignatureFraction = 2/2
    \set Score.caesuraType = #'((breath . chanthalfbar))
  \time 13/4 d,\breve*1/8^\partBc d c d f e d e f d c d d \bar "||"
  \time 4/2 \clef soprano d'1^\partSc e
  f2 fis g a
  b1 a
}

text = \lyricmode {
  Li -- be -- _ ra me, Do -- _ _ _ _ mi -- _ ne,
  De mor --
  te ae -- ter -- _
  _ na,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
