\version "2.24.2"
\include "header.ly"

OboeI = {
  \relative c' {
    \clef treble
    \twofourtime \key b \major \time 2/4 \tempoMarkup "Allegro mà non troppo"
    b'8( d) f( b)
    f16( g) f8 d f
    f( es) c a16( f)
    d'( c) d( es) d8 f
    f( es) c a16( f)
    d'( c) d( es) f4~
  }
}

OboeII = {
  \relative c' {
    \clef treble
    \twofourtime \key b \major \time 2/4 \tempoMarkup "Allegro mà non troppo"
    b'8 d~ d16 b f'8
    d16( es) d8 b d
    d( c) a c16( a)
    b( a) b( c) b8 d
    d( c) a c16( a)
    b( a) b( c) d8 b16 d
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \twofourtime \key b \major \time 2/4 \tempoMarkup "Allegro mà non troppo"
    b'8( d) f( b)
    f16( g) f8 d f
    f( es) c a16( f)
    d'8 b r f'
    f( es) c a16( f)
    d'8 b r d'
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \twofourtime \key b \major \time 2/4 \tempoMarkup "Allegro mà non troppo"
    b'8 d~ d16 b f'8
    d16( es) d8 b d
    d( c) a c16( a)
    b8 d, r d'
    d( c) a c16( a)
    b8 d, r b''
  }
}

Organo = {
  \relative c {
    \clef bass
    \twofourtime \key b \major \time 2/4 \tempoMarkup "Allegro mà non troppo"
    b4 r
    b' b,
    f' f,
    b r
    f' f,
    b r8 b'
  }
}

BassFigures = \figuremode {
  r2
  r
  <6 4>4 <5 3>
  r2
  <6 4>4 <5 3>
  r2
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff \with { \smallGroupDistance } <<
        \set GrandStaff.instrumentName = "ob"
        \new Staff {
          \set Staff.instrumentName = "1"
          \OboeI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \OboeII
        }
      >>
    >>
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
