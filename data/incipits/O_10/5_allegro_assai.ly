\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key b \major \time 4/8 \tempoMarkup "Allegro assai"
    b'16 b d d f f b b
    d d b b f f d d
    b b f f d d f f
    d8 b r4
    d''2\p
    c8([ e,) f( a,)]
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key b \major \time 4/8 \tempoMarkup "Allegro assai"
    b'16 b d d f f b b
    d d b b f f d d
    b b f f d d f f
    d8 b r4
    r8 f''[\p g( f)]
    r e[ f( c)]
  }
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key b \major \time 4/8 \tempoMarkup "Allegro assai"
    b16 b d d f f b b
    d d b b f f d d
    b' b f f d d f f
    d8 b r4
    b'\p r
    a r
  }
}

BassFigures = \figuremode {
  r2
  r
  r
  r
  <3>
  <6>
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
