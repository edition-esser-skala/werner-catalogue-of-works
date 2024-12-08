\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \twofourtime \key b \major \time 2/4 \tempoMarkup "Allegro moderato"
    b''16 f d b d8 f
    b b, r f'
    f16( g) g( f) f( es) es d32 c
    d8 b r c
    d16( c) d8 r c\p
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \twofourtime \key b \major \time 2/4 \tempoMarkup "Allegro moderato"
    d8 f b c
    d16 es d es f8 b,
    b4 a\trill
    b r8 a
    b16( a) b8 r a\p
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \twofourtime \key b \major \time 2/4 \tempoMarkup "Allegro moderato"
    b8 b'4 a8
    g f16 es d4
    es f
    b16 f d b d8 f
    b16 f d b d8 f\p
  }
}

BassFigures = \figuremode {
  r2
  r
  r
  r
  r
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
        \BassoContinuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
