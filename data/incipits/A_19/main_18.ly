\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key g \minor \time 3/8 \tempoMarkup "Vivace"
  \partial 8 d8^\partVi g g,16 a b c
  d c d e fis d \gotoBar "12"
  \clef tenor \autoBeamOff r8^\part "Sisera" r d,
  g16[ fis] g[ a] b[ c]
  d[ cis] d[ e] f![ d]
}

text = \lyricmode {
  \skips 12
  Mich ſchrö -- ken die
  Bü -- ſche, mich
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
  % \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
