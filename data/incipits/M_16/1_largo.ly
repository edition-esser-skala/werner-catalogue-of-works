\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \major \time 3/4 \tempoMarkup "Largo e cantabile"
    cis'8( d) e4( e8. fis32 gis)
    a8( a,) a'4( a8 e)
    fis( a) e( a,) gis( d')
    cis( e) fis( e) a( dis,)
    e4. fis8 gis4\trill
    a4. e8 h'4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \major \time 3/4 \tempoMarkup "Largo e cantabile"
    R2.*4
    gis'8( a) h4( h8. cis32 d)
    e8( e,) e'4( e8 h)
  }
}

Organo = {
  \relative c {
    \clef bass
    \key a \major \time 3/4 \tempoMarkup "Largo e cantabile"
    a'2 gis4
    fis4( fis8. e32 d) cis4
    d cis h
    a a'8 gis fis4
    e2 d4
    cis( cis8. h32 a) gis4
  }
}

BassFigures = \figuremode {
  r2.
  r
  r2 <6\\>4
  r <6>8 q <7> <6\\>
  r2 <4\+ 2>4
  <6>2.
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
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8) }
}
