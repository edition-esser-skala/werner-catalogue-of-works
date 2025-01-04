\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key b \major \time 4/4 \tempoMarkup "Andante"
  r4^\partVi f'8 f, b b'~ b16 g f es
  \tuplet 3/2 8 { d16 c b } b8 \gotoBar "5" \clef tenor \autoBeamOff
    f8^\part Job f, b16[ a] b8 c \tuplet 3/2 8 { c16[ d es] }
  d8 f~ f16[ d] c[ b] a4 c8 f
}

text = \lyricmode {
  \skips 11
  Al -- ſo folgt auf Leyd die
  Freud je -- der -- zeit den, der
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8) }
}
