\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
  f2^\partSs c'4. d16[ e]
  f8 f, r4 r2
  c'2 c16[ d e8] f g
}

text = \lyricmode {
  Be -- ne -- _
  di -- ctus,
  qui ve -- nit in
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
