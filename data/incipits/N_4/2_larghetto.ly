\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \minor \time 3/2 \tempoMarkup "Larghetto"
    d2~\p d8 e f4 f8( e) d4
    e8( d) e4 cis8( h) \hA cis4 a2
    d'2~\f d8( e) f4 f8( e) d4
    gis4.( a8) \hA gis4.( a8) a,2
    b!8(\trill\pp a) b4 r b r gis
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \minor \time 3/2 \tempoMarkup "Larghetto"
    d2~\p d8 e f4 f8( e) d4
    e8( d) e4 cis8( h) \hA cis4 a2
    d'2~\f d8( e) f4 f8( e) d4
    gis8( a4.) \hA gis8( a4.) a,2
    g!\p d8( c) d4 e8( d) e4
  }
}

Viola = {
  \relative c' {
    \clef alto
    \key d \minor \time 3/2 \tempoMarkup "Larghetto"
    f8(\p g) a4 a8( g) a4 a,2
    a4( cis) e8( d) e4 cis2
    d8(\f e) f4 f8( g) a4 a8( g) f4
    gis8( a4.) \hA gis8( a4.) a,2
    R1.
  }
}

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 3/2 \tempoMarkup "Larghetto"
    d2\p f d
    cis a r
    d\f f d
    a' a, r
    R1.
  }
}

BassFigures = \figuremode {
  %tacet
}

\score {
  <<
    \new StaffGroup \with { \smallGroupDistance } <<
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
