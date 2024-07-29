\version "2.24.2"
\include "header.ly"

Chords = {
  \relative c' {
    \clef treble
    \key c \major \time 3/4 \tempoMarkup "Allegro"
    << {
      <e g>4 <c e> <d f>
      e g e
      f2 e4
      g f e
    } \\ {
      g,2.
      <g c>~
      q4 h g
      g2.
     } >>
  }
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 3/4 \tempoMarkup "Allegro"
    \mvTr c2\p-\solo h4
    c e c
    d g, c
    c d e
  }
}

\score {
  <<
    \new PianoStaff <<
      \set PianoStaff.instrumentName = "org"
      \new Staff { \Chords }
      \new Staff { \Organo }
    >>
  >>
}
