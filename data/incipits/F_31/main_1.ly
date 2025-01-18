\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key d \minor \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    \set Staff.timeSignatureFraction = 3/2
  a2.^\partTc f4 b2
  a c2. b4
  a2 d2. cis4
  d2
}

text = \lyricmode {
  A -- ve ma --
  ris stel -- _
  _ _ _
  la,
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
