\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "Largo"
  r8^\part "Savoiard" e4 c8 a16[ gis] a8 \tuplet 3/2 8 { a'16[ g f] } e[ dis]
  \tuplet 3/2 8 { e[ dis e] } e,8 h'4 r8 h d f
}

text = \lyricmode {
  O che bel -- la Tor -- to --
  rel -- la! ô che bel -- la
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
  % \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
