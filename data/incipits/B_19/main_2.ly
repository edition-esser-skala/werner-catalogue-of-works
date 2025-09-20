\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef alto
  \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Andante"
  r4^\partAs d4. e8 f g
  a f b a16[ g] f4 r
  \clef soprano a8^\partSs c b d g,[ a] b4
}

text = \lyricmode {
  Et in ter -- ra
  pax ho -- mi -- ni -- bus
  bo -- nae vo -- lun -- ta \hy
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
