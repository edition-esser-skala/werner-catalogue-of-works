\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 3/8 \tempoMarkup "Andante"
    \partial 8 d8 g4 a16( h)
    g8 h d16( e)
    d( cis) a( g) h8
    g g, d''
    g4 a16( h)
    g8 h d16( e)
    d( cis) a( g) h8
    g4 d'16( h)
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 3/8 \tempoMarkup "Andante"
    \partial 8 d8 g4 a16( h)
    g8 h d16( e)
    d( cis) a( g) h8
    g g, d''
    g4 a16 h
    g8 h d16( e)
    d( cis) a( g) h8
    g4 d8
  }
}

Viola = {
  \relative c' {
    \clef alto
    \key g \major \time 3/8 \tempoMarkup "Andante"
    \partial 8 d8~ d g fis
    g d d
    fis d d
    h4 d8
    g4 a16 h
    g8 h d16( e)
    d( cis) a( g) h8
    g d h'
  }
}

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 3/8 \tempoMarkup "Andante"
    \partial 8 d8 h g d'
    h g r
    d'4 d,8
    g4 d'8^\markup \remark "alla 8va"
    g4 a16 h
    g8 h d16 e
    d( cis) a g h8
    g h, g
  }
}

BassFigures = \figuremode {
  <_+>8 <6>4 <_+>8
  <6>4.
  r
  r
  r
  r
  r
  r8 <6>4
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
