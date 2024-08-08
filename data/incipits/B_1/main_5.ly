\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef treble
  \key a \minor \time 4/4 \tempoMarkup "Tempo giusto"
  e'4.^\partVi c'64( h a16.) a16( gis) gis8 a, f'64( e d16.) \gotoBar "5"
  \clef soprano \autoBeamOff
    e4~^\partSs e16[ c] h[ a] \grace d8 f4 e16[ d] c[ h]
}

text = \lyricmode {
  \repeat unfold 6 { \skip 8 }
  Be -- ne -- di -- ctus, qui
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
