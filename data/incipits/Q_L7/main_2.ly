\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef tenor
  \key a \minor \time 3/4 \tempoMarkup "[no tempo]"
  e,4-!^\part "vlc [?]" c'( h)
  a-! d( e)
  f \grace { e16[ f] } e4
}

\score {
  <<
    \new Voice = "incipit" { \notes }
  >>
}
