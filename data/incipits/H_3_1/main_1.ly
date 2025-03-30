\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key b \major \time 4/4 \tempoMarkup "Adagio" \autoBeamOff
  r4^\partSc b' b4. b8
  a4 h c8. c16 c4
  g'8 es16 d c8 b16 c a8[ b] b4
}

text = \lyricmode {
  Ma -- gni -- fi --
  cat, ma -- gni -- fi -- cat
  a -- ni -- ma, a -- ni -- ma me -- a
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
