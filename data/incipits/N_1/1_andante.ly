\version "2.24.2"
\include "header.ly"

ViolinoPrincipale = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "Andante"
    d'8 d, d fis16( a,) d8 a'16( fis) d8 fis16( a,)
    d8 a'16( fis) d8 fis16( a,) \sbOn \tuplet 3/2 8 { d e d } a'( fis) \tuplet 3/2 8 { d e d } fis( a,)
    \tuplet 3/2 8 { d e d } a'( fis) \tuplet 3/2 8 { d e d } fis( a,) \sbOff d( a') d( a) fis'( d) a'( fis)
    d( a) fis( d) fis'( d) a'( fis) d( a) fis( d) fis'( d) a'( fis)
    d8 d' d d d16( cis) a8 cis16( h) e,8
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "Andante"
    d'8 d, d fis16( a,) d8 a'16( fis) d8 fis16( a,)
    d8 a'16( fis) d8 fis16( a,) \sbOn \tuplet 3/2 8 { d e d } a'( fis) \tuplet 3/2 8 { d e d } fis( a,)
    \tuplet 3/2 8 { d e d } a'( fis) \tuplet 3/2 8 { d e d } fis( a,) \sbOff d( a') d( a) fis'( d) a'( fis)
    d( a) fis( d) fis'( d) a'( fis) d( a) fis( d) fis'( d) a'( fis)
    d8 d' d d d16( cis) a8 cis16( h) e,8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "Andante"
    d'8 d, d fis16( a,) d8 a'16( fis) d8 fis16( a,)
    d8 a'16( fis) d8 fis16( a,) \sbOn \tuplet 3/2 8 { d e d } a'( fis) \tuplet 3/2 8 { d e d } fis( a,)
    \tuplet 3/2 8 { d e d } a'( fis) \tuplet 3/2 8 { d e d } fis( a,) \sbOff d8 fis16( a) d8( fis)
    d, fis16( a) d8( fis) d, fis16( a) d8( fis)
    d, d' d d d16( cis) a8 cis16( h) e,8
  }
}

Viola = {
  \relative c' {
    \clef alto
    \key d \major \time 4/4 \tempoMarkup "Andante"
    fis8 fis fis a fis4. fis16( a)
    fis4. fis16( a) fis2~
    fis1~
    fis~
    fis8 d' d d d16( cis) a8 cis16( h) e,8
  }
}

Organo = {
  \relative c {
    \clef bass
    \key d \major \time 4/4 \tempoMarkup "Andante"
    d'8 d, d d d4.-\unisono fis16 a
    d,4. fis16 a d,2~-\tasto
    d1~
    d~
    d8 d'-\unisono d d d16( cis) a8 cis16( h) e,8
  }
}

BassFigures = \figuremode {
  r1
  r
  r
  r
  r
}

\score {
  <<
    \new Staff {
      \set Staff.instrumentName = "vl princ"
      \ViolinoPrincipale
    }
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
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
