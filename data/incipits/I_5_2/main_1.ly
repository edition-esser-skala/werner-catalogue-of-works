\version "2.24.2"
\include "header.ly"

notes = \relative c' {
  \clef soprano
  \key f \major \time 4/4 \tempoMarkup "Andante molto" \autoBeamOff
  f2^\partSs a16[ b a b] c8 d
  \tuplet 3/2 4 { c[ b a] b[ a g] } a4 r8 b
  \tuplet 3/2 4 { a[ g f] g[ f e] } f4 a~
}

text = \lyricmode {
  Sub tu -- um prae --
  si -- di -- um con --
  fu -- gi -- mus, "San -"
}

\score {
  <<
    \new Voice = "incipit" { \notes }
    \new Lyrics \lyricsto "incipit" { \text }
  >>
}
