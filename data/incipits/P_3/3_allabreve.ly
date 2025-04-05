\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \twotwotime \key b \major \time 2/2 \tempoMarkup "Allabreve"
    b'1
    f'2. g8 a
    b2. a8 g
    f4 es d c
    b a g f
    es1
    d2 r4 c'
    b c d e
    f f, f'2
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \twotwotime \key b \major \time 2/2 \tempoMarkup "Allabreve"
    R1*4
    r2 es4 f
    g a b c
    d es f g8 a
    b1
    a2 f,
  }
}

Viola = {
  \relative c' {
    \clef alto
    \twotwotime \key b \major \time 2/2 \tempoMarkup "Allabreve"
    R1*4
    r2 c4 d
    es f g a
    b2 f
    g1
    c,
  }
}

Continuo = {
  \relative c {
    \clef bass
    \twotwotime \key b \major \time 2/2 \tempoMarkup "Allabreve"
    r2 b'~
    b a
    g4 f8 es d4 es
    f2. es4
    d2 es4 d
    c1
    b2 a
    g1
    f
  }
}

BassFigures = \figuremode {
  r1
  <4 2>2 <6>
  <3>4 q8 q <6>4 <5>
  r1
  <6>
  <7>2 <6>
  r q
  <7>2. <6!>4
  r1
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
        \set Staff.instrumentName = "vla"
        \Viola
      }
      \new Staff {
        \set Staff.instrumentName = "bc"
        \Continuo
      }
      \new FiguredBass { \BassFigures }
    >>
  >>
}
