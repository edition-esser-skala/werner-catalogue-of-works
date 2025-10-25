\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key b \major \time 4/4 \tempoMarkup "Allegro"
    r16 b'' b b b b b b f4-! es-!
    d8 f(\p g f) r es( f es)
    d16\f b b b b b b b f4-! es-!
    d8 f(\p g f) r es( f es)
    d16\f f' f f f f f f g8 r a r
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key b \major \time 4/4 \tempoMarkup "Allegro"
    r16 d' d d f8 d c a4 c8
    f, d'(\p es d) r c( a c)
    b16\f d, d d f8 d c a4 c8
    r d\p es d r c a c
    b16\f d' d d d d d d e8 r f r
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key b \major \time 4/4 \tempoMarkup "Allegro"
    b8 b' d, b a c f, a
    b4 r a\p r
    b8\f b' d, b a c f, a
    b4 r a\p r
    b\f r r16 b' b b a a a a
  }
}

BassFigures = \figuremode {
  r4 <6> q <7 3>8 <3>
  r2 <5 3>
  r4 <6> q <7 3>
  r2 <5 3>
  r r16 <6 4!>8. <6>4
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
