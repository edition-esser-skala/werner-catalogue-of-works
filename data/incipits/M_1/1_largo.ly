\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \minor \time 3/2 \tempoMarkup "Largo"
    d'4.( c8) b4( d,) \tuplet 3/2 2 { a'4 b c
    b a g } g'2~ \tuplet 3/2 { g4 a b }
    a2~ a8( g fis4) es!8( d c4)
    c( b) b'1~
    b4 a8 b a4 g f es
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \minor \time 3/2 \tempoMarkup "Largo"
    b'4.( a8) g2 fis
    g1 es'2~
    es4( d) d2 c8( b) a4~
    a( g) g'1~
    g4( f) c1~
  }
}

Organo = {
  \relative c {
    \clef bass
    \key g \minor \time 3/2 \tempoMarkup "Largo"
    g'1 d2
    g,1.
    fis1 fis2
    g1 es'2
    f!1 a,2
  }
}

BassFigures = \figuremode {
  r1 <_+>2
  r1 <6->2
  <7->4 <6>2. <7- 5>2
  <9 4>4 <8 3>2. <5>2
  <9 4>4 <8 3>2. <6>4 <5>
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
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
