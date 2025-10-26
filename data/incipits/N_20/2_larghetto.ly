\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \minor \time 3/4 \tempoMarkup "Larghetto"
    a'2\f d4
    a2 g8( a,)
    f'4( g) e
    d2 cis8( a')
    f4( d) cis8( a)
    f'4 d e8( a,)
    f' g a4 gis
    a2 r4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \minor \time 3/4 \tempoMarkup "Larghetto"
    f2\f d8 e
    f2 e4
    d( e) cis
    d2 cis4
    d2 cis8( a)
    d2 e8( a,)
    f'4 e d
    cis2 r4
  }
}

Viola = {
  \relative c' {
    \clef alto
    \key d \minor \time 3/4 \tempoMarkup "Larghetto"
    d2\f f8 e
    d2 e4
    a, b a
    a2 a4
    a2 a4
    a2 a4
    a2 b4
    e,2 r4
  }
}

Chords = {
  \relative c' {
    \clef treble
    \key d \minor \time 3/4 \tempoMarkup "Larghetto"
    s2.*8
  }
}

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 3/4 \tempoMarkup "Larghetto"
    d2 r4
    d d' cis
    d g, a
    d, f a
    d, f a
    d, f cis
    d c b
    a a'8 g f e
  }
}

BassFigures = \figuremode {
  r2.
  r2 <5>4
  r <6 8> <5 _+>
  r2 <_+>4
  r2 q4
  r2.
  r4 <6> <6\\>
  <_+>2.
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
    >>
    \new PianoStaff <<
      \set PianoStaff.instrumentName = \markup \center-column { "org" "solo" }
      \new Staff { \Chords }
      \new Staff {
        \set Staff.instrumentName = "b"
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
