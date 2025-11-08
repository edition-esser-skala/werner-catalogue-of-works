\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \minor \time 4/4 \tempoMarkup "Adagio"
    h'16 c d es f g as h, c8 g c,4
    a'16 b c d es f g a, b8 f b,4
    e'16 b a g b'( a) a( g) fis2
    g8 g g g cis, cis cis cis
    d1
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \minor \time 4/4 \tempoMarkup "Adagio"
    r2 c16 d es f g a h c
    f,4 r b,!16 c d es f g a b
    b8 g e4 a16 fis e d es' d d c
    b8 b b b g g g g
    fis1
  }
}

Continuo = {
  \relative c {
    \clef bass
    \key g \minor \time 4/4 \tempoMarkup "Adagio"
    f!8 f f f es es es es
    es es es es d d d d
    cis cis cis cis c c c c
    g16 a b c d e fis g es?8 es es es
    d1
  }
}

BassFigures = \figuremode {
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff \with { \smallGroupDistance } <<
        \set GrandStaff.instrumentName = "vl"
        \new Staff {
          \set Staff.instrumentName = "1"
          \ViolinoI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ViolinoII
        }
      >>
      \new Staff {
        \set Staff.instrumentName = "bc"
        \Continuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
