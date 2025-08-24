\version "2.24.2"
\include "header.ly"

notes = \relative c {
  \clef bass
  \key c \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
  g'4.^\partBc g8 e f16[ g] a8 f
  d[ e16 f] g8 e \clef soprano c''4.^\partSc c8
  h c16[ d] e8 c a[ h16 c] d8 h
  g
}

text = \lyricmode {
  Con -- fi -- te -- bor ti -- bi,
  Do -- _ "mi -" Con -- fi --
  te -- bor ti -- bi, Do -- _ mi --
  ne,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
