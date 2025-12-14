\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key b \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
  b4^\partAs c16[ b] c8 d es16 f g8 g
  f f r4 r f8 g
  a a16[ b] c[ a] g[ f] e8 f16 f f8[ \hA e]
}

text = \lyricmode {
  Lau -- da -- te Do -- mi -- num, o -- mnes
  gen -- tes, su -- per
  nos mi -- se -- ri -- cor -- di -- a "e -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
