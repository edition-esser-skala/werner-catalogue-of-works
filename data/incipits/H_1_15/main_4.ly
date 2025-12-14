\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Andante"
  d'4.^\partSs a8 f'8. e16 d4
  r8 d c!16[ g] a[ b] a8 b16 c d4
  g, r8 e' a, c16 c f8 d
}

text = \lyricmode {
  Ni -- si Do -- mi -- nus
  ae -- di -- fi -- ca -- ve -- rit do --
  mum, in va -- num la -- bo -- "ra -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
