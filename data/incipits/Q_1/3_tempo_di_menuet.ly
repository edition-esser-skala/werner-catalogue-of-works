\version "2.24.2"
\include "header.ly"

\paper { indent = 1.5\cm }

ChalumeauI = {
  \relative c' {
    \clef treble
    \key b \major \time 3/8 \tempoMarkup "Tempo di menuet"
    b'8 c8.\trill b32( c)
    d8-! es-! r
    f g g,16 c
    a8-! b-! r
    f16 c' es8 d16( f)
    \appoggiatura b,8 a4\trill b8
    f' es16( c) b( d)
    c4 r8
  }
}

ChalumeauII = {
  \relative c' {
    \clef treble
    \key b \major \time 3/8 \tempoMarkup "Tempo di menuet"
    b'8 c8.\trill b32( c)
    d8-! b-! r
    b4 es16( c)
    a8-! b-! r
    f16 a c8 b
    \appoggiatura b a4\trill b8
    c8. a16 d b
    a( f') a,8 b
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key b \major \time 3/8 \tempoMarkup "Tempo di menuet"
    b'8\f c8.\trill b32( c)
    d8-! es-! r
    f g g,16 c
    a8-! b-! r
    f16 c' es8 d16( f)
    \appoggiatura b,8 a4\trill b8
    f' es16( c) b( d)
    c4 r8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key b \major \time 3/8 \tempoMarkup "Tempo di menuet"
    d8 f16 g a8
    f-! b-! r
    b4 es16( c)
    a8-! b-! r
    f16 a c8 b
    \appoggiatura b a4\trill b8
    c8. a16 d b
    a( f') a,8 b
  }
}

Organo = {
  \relative c {
    \clef bass
    \key b \major \time 3/8 \tempoMarkup "Tempo di menuet"
    b'8 a f
    b-! g-! r
    d es4
    f8-! g-! r
    a4 b8
    f es d
    a4 b8
    f f' g
  }
}

BassFigures = \figuremode {
  r4.
  r8 <6>4
  q8 <5> <6>
  r4.
  <6>8 <5>4
  r4.
  <6>8 <5>4
  r4.
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "chalumeau"
        \new Staff {
          \set Staff.instrumentName = "1"
          \ChalumeauI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ChalumeauII
        }
      >>
    >>
    \new StaffGroup <<
      \new GrandStaff <<
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
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
